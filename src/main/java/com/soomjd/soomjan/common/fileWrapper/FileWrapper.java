package com.soomjd.soomjan.common.fileWrapper;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author 임예람
 *
 * 파일 업로드, 파일 다운로드를 위한 클래스
 */
public class FileWrapper {
	
	/**
	 * 파일 업로드 처리
	 * @param file 파라미터로 받은 multipartFile
	 * @param savedName	저장할 이름
	 * @param filePath 저장할 파일 경로
	 * @return 성공시 true, 실패시 false
	 * 
	 * @author 임예람
	 */
	public boolean uploadSingleFile(MultipartFile file, String savedName, String filePath) {
		
		// 성공 여부를 판단할 return값 설정
		boolean result = false;
		
		// 해당 경로가 있는지 체크하여 경로가 없으면 폴더를 생성한다.
		File mkdir = new File(filePath);
		if(!mkdir.exists()) { mkdir.mkdirs(); }
		
		// multipartFile을 매개변수로 받은 경로에 지정한 이름으로 저장
		try {
			file.transferTo(new File(filePath + "/" + savedName));
			System.out.println("파일 업로드 성공");
			result = true;
		} catch (IllegalStateException | IOException e) {	// 오류 발생시 해당 파일 삭제
			e.printStackTrace();
			new File(filePath + "/" + savedName).delete();
			System.out.println("파일 업로드 실패");
		}
		
		return result;
	}
	
	
	/**
	 * 파일 다운로드
	 * @param file	다운받을 파일
	 * @param os 파일을 내보낼 outputStream
	 * @return 성공시 true, 실패시 false
	 * 
	 * @author 임예람
	 */
	public boolean downloadSingleFile(File file, OutputStream os) {
		
		boolean result = false;
		
		// 파일의 내용을 byte단위로 읽어오기 때문에 읽어서 저장할 byte배열 선언
		byte[] buffer = new byte[1024];
		FileInputStream fis = null;

		try {
			// 파일 인풋스트림에 파일 담기
			fis = new FileInputStream(file);
			
			int readCount = 0;
			
			// 파일을 buffer만큼 읽고 그 길이를 readCount에 저장한다. 
			// readCount가 0이면 파일을 모두 읽은 것이므로 readCount가 0보다 클 때까지만 반복한다.
			while((readCount = fis.read(buffer)) > 0) {
				// 파일을 저장한 버퍼를 0부터 그 길이 만큼인 readCount만큼 쓴다.
				os.write(buffer, 0, readCount);
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("다운로드 실패");
		} finally {
			// 입출력 객체 닫아주기
			try {
				fis.close();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	

}
