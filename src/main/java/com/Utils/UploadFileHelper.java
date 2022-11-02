package com.Utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class UploadFileHelper {
	public static List<String> uploadFile(String UPLOAD_DIR, HttpServletRequest request, String parameter) {
		List<String> fileNames = new ArrayList<String>();
		try {
			for (Part part : request.getParts()) {
				if (part.getName().equalsIgnoreCase(parameter)) {
					String fileName = getFileName(part);
					fileNames.add(fileName);
					String applicationPath = request.getServletContext().getRealPath("");
					String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
//					System.out.println("basePath: " + basePath);
					InputStream inputStream = null;
					OutputStream outputStream = null;
					try {
						File outputFilePath = new File(basePath + fileName);
						inputStream = part.getInputStream();
						outputStream = new FileOutputStream(outputFilePath);
						int read = 0;
						final byte[] bytes = new byte[1024];
						while ((read = inputStream.read(bytes)) != -1) {
							outputStream.write(bytes, 0, read);
						}
					} catch (Exception ex) {
						fileName = null;
					} finally {
						if (outputStream != null) {
							outputStream.close();
						}
						if (inputStream != null) {
							inputStream.close();
						}
					}
				}
			}
		} catch (Exception e) {
			fileNames = null;
		}
		return fileNames;
	}

	private static String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
