package com.joomjan.common.fileWrapper;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileWrapper {
	
	public boolean uploadSingleFile(MultipartFile file, String savedName, String filePath) {
		
		boolean result = false;
		
		File mkdir = new File(filePath);
		if(!mkdir.exists()) { mkdir.mkdirs(); }
		
		try {
			file.transferTo(new File(filePath + "\\" + savedName));
			System.out.println("파일 업로드 성공");
			result = true;
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			new File(filePath + "\\" + savedName).delete();
			System.out.println("파일 업로드 실패");
		}
		
		return result;
	}
	
	public boolean downloadSingleFile(File file, OutputStream os) {
		
		boolean result = false;
		
		byte[] buffer = new byte[1024];
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			
			int readCount = 0;
			while((readCount = fis.read(buffer)) > 0) {
				os.write(buffer, 0, readCount);
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("다운로드 실패");
		} finally {
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
