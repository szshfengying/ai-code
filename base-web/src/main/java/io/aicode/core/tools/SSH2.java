/*
 *
 *                        http://www.aicode.io
 *
 *
 *        本代码仅用于AI-Code.
 *
 */

package io.aicode.core.tools;

import com.jcraft.jsch.*;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.Scanner;

/**
 * java ssh登录linux以后的一些操作方式
 * Created by lixin on 2017/10/18.
 */
@Slf4j
public class SSH2 {
    private final static Logger log = LoggerFactory.getLogger(SSH2.class);

    public static void main(String[] args) {
        while (true) {
            Scanner scan = new Scanner(System.in);
            String read = scan.nextLine();
            if (read != null) {
                try {
                    SSH2 helper = null;
                    if (helper == null) {
                        //使用目标服务器机上的用户名和密码登陆
                        helper = new SSH2("192.168.1.220", 22, "pitop", "0");
                    }
                    try {
                        SSHResInfo resInfo = helper.sendCmd(read);
                        System.out.println(resInfo.toString());
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                        helper.close();
                    }
                } catch (JSchException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }

    private String charset = Charset.defaultCharset().toString();
    private Session session;

    public SSH2() {
    }

    public SSH2(String host, Integer port, String user, String password) throws JSchException {
        this.connect(host, port, user, password);
    }

    /**
     * 链接ssh服务器
     *
     * @param host     远程主机ip地址
     * @param port     连接端口，null 时为默认端口
     * @param user     用户名
     * @param password 密码
     * @return Session 链接会话
     * @throws JSchException
     */
    private Session connect(String host, Integer port, String user, String password) throws JSchException {
        try {
            JSch jsch = new JSch();
            if (port != null) {
                session = jsch.getSession(user, host, port.intValue());
            } else {
                session = jsch.getSession(user, host);
            }
            session.setPassword(password);
            //设置第一次登陆的时候提示，可选值:(ask | yes | no)
            session.setConfig("StrictHostKeyChecking", "no");
            //50秒连接超时
            session.connect(50000);
        } catch (JSchException e) {
            e.printStackTrace();
            log.error("ssh 链接失败");
            throw e;
        }
        return session;
    }

    public SSHResInfo sendCmd(String command) throws Exception {
        return sendCmd(command, 200);
    }


    /**
     * 执行命令，返回执行结果
     *
     * @param command 命令
     * @param delay   估计shell命令执行时间
     * @return String 执行命令后的返回
     * @throws JSchException
     */
    public SSHResInfo sendCmd(String command, int delay) throws Exception {
        if (delay < 50) {
            delay = 50;
        }
        SSHResInfo result = null;
        byte[] tmp = new byte[1024]; //读数据缓存
        StringBuffer strBuffer = new StringBuffer();  //执行SSH返回的结果
        StringBuffer errResult = new StringBuffer();

        Channel channel = session.openChannel("exec");
        ChannelExec ssh = (ChannelExec) channel;
        //返回的结果可能是标准信息,也可能是错误信息,所以两种输出都要获取
        //一般情况下只会有一种输出.
        //但并不是说错误信息就是执行命令出错的信息,如获得远程java JDK版本就以
        //ErrStream来获得.
        InputStream stdStream = ssh.getInputStream();
        InputStream errStream = ssh.getErrStream();

        ssh.setCommand(command);
        ssh.connect();

        try {


            //开始获得SSH命令的结果
            while (true) {
                //获得错误输出
                while (errStream.available() > 0) {
                    int i = errStream.read(tmp, 0, 1024);
                    if (i < 0) break;
                    errResult.append(new String(tmp, 0, i));
                }

                //获得标准输出
                while (stdStream.available() > 0) {
                    int i = stdStream.read(tmp, 0, 1024);
                    if (i < 0) break;
                    strBuffer.append(new String(tmp, 0, i));
                }
                if (ssh.isClosed()) {
                    int code = ssh.getExitStatus();
                    log.info("exit-status: " + code);
                    result = new SSHResInfo(code, strBuffer.toString(), errResult.toString());
                    break;
                }
                try {
                    Thread.sleep(delay);
                } catch (Exception ee) {
                    ee.printStackTrace();
                }
            }
        } finally {
            // TODO: handle finally clause
            channel.disconnect();
        }

        return result;
    }


    public SSHResInfo shell(String cmd, int delay) throws Exception {
        if (delay < 50) {
            delay = 50;
        }
        SSHResInfo result = null;
        byte[] tmp = new byte[1024]; //读数据缓存
        StringBuffer strBuffer = new StringBuffer();  //执行SSH返回的结果
        StringBuffer errResult = new StringBuffer();


        ChannelShell channelShell = (ChannelShell) session.openChannel("shell");
        channelShell.connect();

        //从远程端到达的所有数据都能从这个流中读取到
        InputStream in = channelShell.getInputStream();
        //写入该流的所有数据都将发送到远程端。
        OutputStream outputStream = channelShell.getOutputStream();
        PrintWriter printWriter = new PrintWriter(outputStream,true);
        printWriter.println(cmd);
//        printWriter.println(cmd+"\n exit");
//        printWriter.println("exit");//加上个就是为了，结束本次交互
        printWriter.flush();
        while (true) {
            while (in.available() > 0) {
                int i = in.read(tmp, 0, 1024);
                if (i < 0) break;
                strBuffer.append(new String(tmp, 0, i));
            }

            if (channelShell.isClosed()) {
                if (in.available() > 0) continue;
                int code = channelShell.getExitStatus();
                result = new SSHResInfo(code, strBuffer.toString(), null);
                break;
            }

            try {
                Thread.sleep(delay);
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }


        return result;
    }


    /**
     * @param in
     * @param charset
     * @return
     */
    private String processStream(InputStream in, String charset) throws Exception {
        byte[] buf = new byte[1024];
        StringBuilder sb = new StringBuilder();
        while (in.read(buf) != -1) {
            sb.append(new String(buf, charset));
        }
        return sb.toString();
    }

    public boolean deleteRemoteFIleOrDir(String remoteFile) {
        ChannelSftp channel = null;
        try {
            channel = (ChannelSftp) session.openChannel("sftp");
            channel.connect();
            SftpATTRS sftpATTRS = channel.lstat(remoteFile);
            if (sftpATTRS.isDir()) {
                //目录
                log.debug("remote File:dir");
                channel.rmdir(remoteFile);
                return true;
            } else if (sftpATTRS.isReg()) {
                //文件
                log.debug("remote File:file");
                channel.rm(remoteFile);
                return true;
            } else {
                log.debug("remote File:unkown");
                return false;
            }
        } catch (JSchException e) {
            if (channel != null) {
                channel.disconnect();
                session.disconnect();
            }
            log.error("error", e);
            return false;
        } catch (SftpException e) {
            log.info("meg" + e.getMessage());
            log.error("SftpException", e);
            return false;
        }

    }

    /**
     * 判断linux下 某文件是否存在
     */
    public boolean detectedFileExist(String remoteFile) {

        ChannelSftp channel = null;
        try {
            channel = (ChannelSftp) session.openChannel("sftp");
            channel.connect();
            SftpATTRS sftpATTRS = channel.lstat(remoteFile);
            if (sftpATTRS.isDir() || sftpATTRS.isReg()) {
                //目录 和文件
                log.info("remote File:dir");
                return true;
            } else {
                log.info("remote File:unkown");
                return false;
            }
        } catch (JSchException e) {
            if (channel != null) {
                channel.disconnect();
                session.disconnect();
            }
            return false;
        } catch (SftpException e) {
            log.error(e.getMessage());
        }
        return false;
    }


    /**
     * 用完记得关闭，否则连接一直存在，程序不会退出
     */
    public void close() {
        if (session.isConnected())
            session.disconnect();
    }

}