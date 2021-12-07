package com.joomjan.common.fileWrapper;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Vector;

import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

public class JSchWrapper {
	
	private Session session = null;
	private Channel channel = null;
	private ChannelSftp channelSftp = null;
	
	/**
	 * SFTP 파일 업로드 서버 연결
	 */
	public void connectionSFTP(){
		
		String url = "125.132.252.115";
		String id = "jandi";
		int port = 22022;
		String password="0830";
		
		JSch jsch = new JSch();
		
		try {
			session = jsch.getSession(id, url, port);
			session.setPassword(password);
			
			// 세션 관련 설정 정보
			java.util.Properties config = new java.util.Properties();
			
			// 호스트 정보 검사 X
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);
			System.out.println("session: " + session);
			session.connect();
			
			channel = session.openChannel("sftp");
			channel.connect();
			System.out.println("channel: " + channel);
			
		} catch (JSchException e) {
			e.printStackTrace();
		}
		
		channelSftp = (ChannelSftp) channel;
		System.out.println("channelSftp: " + channelSftp);
		
	}
	
	
	/**
	 * SFTP 파일 업로드 서버 닫기
	 */
	public void disconnectSFTP() {
		
		if(channelSftp != null && channelSftp.isConnected()) {
			channelSftp.disconnect();
		}
		
		if(channel != null && channel.isConnected()) {
			channel.disconnect();
		}
		
		if(session != null && session.isConnected()) {
			session.disconnect();
		}
	}
	
	/**
	 * 디렉토리 조회용 메소드
	 * @param directory
	 */
	public void printFileAndFolder(String directory) {
		//해당 디렉토리 조회
		Vector<ChannelSftp.LsEntry> fileList;
		try {
			fileList = channelSftp.ls(directory);
			for(ChannelSftp.LsEntry item : fileList) {
				System.out.println(item.getFilename());
			}
		} catch (SftpException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param file
	 * @param directory
	 * @param savedName 변경할 이름
	 * @return
	 */
	public boolean uploadFile(MultipartFile file, String directory, String savedName) {
		
		boolean result = false;
		FileInputStream fileStream = null;
		
		// sftp 연결
		connectionSFTP();
		
		try {
			// 파일 저장
			fileStream = (FileInputStream) file.getInputStream();
			
			// 해당 디렉토리로 이동
			channelSftp.cd(directory);
			// 해당 경로에 업로드
			channelSftp.put(fileStream, savedName);
			
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			
			System.out.println("파일 업로드 실패");
			
			try {
				//실패시 해당 파일 삭제
				channelSftp.rm(savedName);
				
				System.out.println("업로드 실패한 파일 삭제");
				
			} catch (SftpException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				fileStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// sftp 종료
		disconnectSFTP();
		
		return result;
	}
	
	/**
	 * 원격 저장소의 파일을 제거하는 메소드
	 * @param fileName
	 * @param directory
	 * @return
	 */
	public boolean removeFile(String fileName, String directory) {
		// sftp 연결
		connectionSFTP();
		
		boolean result = false;
		
		try {
			channelSftp.cd(directory);
			channelSftp.rm(fileName);

			result = true;
		} catch (SftpException e) {
			e.printStackTrace();
		}
		
		// sftp 종료
		disconnectSFTP();
		
		return result;
	}
	
	/**
	 * 원격 저장소의 파일을 로컬 저장소로 다운로드 하는 메소드
	 * @param remotePath
	 * @param localPath
	 * @param fileName
	 * @return
	 */
	public boolean downloadFile(String remoteDir, String localPath, String fileName) {
		
		connectionSFTP();
		
		boolean result = false;
		
		byte[] buffer = new byte[1024];
		BufferedInputStream bis = null;
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		
		try {
			channelSftp.cd(remoteDir);
			// 원격에 있는 파일 가져오기
			bis = new BufferedInputStream(channelSftp.get(fileName));
			System.out.println(channelSftp.get(fileName));
			// 로컬 경로에 생성하기
			File file = new File(localPath + "/" + fileName);
			fos = new FileOutputStream(file);
			bos = new BufferedOutputStream(fos);
			
			int readCount = 0;
			while((readCount = bis.read(buffer)) > 0) {
				bos.write(buffer, 0, readCount);
			}
			
			result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 다운 실패!");
			new File(localPath + "/" + fileName).delete();
		} finally {
			try {
				bos.close();
				fos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		disconnectSFTP();
		return result;
	}
	
	
	public BufferedInputStream getFile(String fileName, String directory) {
		
		connectionSFTP();
		BufferedInputStream bis = null;
		
		try {
			channelSftp.cd(directory);
			bis = new BufferedInputStream(channelSftp.get(fileName));
		} catch (SftpException e) {
			e.printStackTrace();
		}
		
		disconnectSFTP();
		
		return bis;
	}
	
	// 테스트 용!
//	public static void main(String[] args) {
//		
//		JSchWrapper jsch = new JSchWrapper();
//		if(jsch.uploadFile(new File("C:\\Users\\lenovo-com\\Videos\\2021-11-08 00-43-57.mp4"), "lectureFiles/test")) {
//			System.out.println("업로드!");
//		}
//		if(jsch.downloadFile("lectureFiles/test", "C:\\Users\\lenovo-com\\Desktop", "2021-11-08 00-43-57.mp4")) {
//			System.out.println("다운!");
//		}
//	}

}
