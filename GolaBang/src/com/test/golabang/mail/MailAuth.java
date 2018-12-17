package com.test.golabang.mail;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.test.golabang.JoinDAO;

@WebServlet("/mailauth.do")
public class MailAuth extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		req.setCharacterEncoding("UTF-8");
		String from = "sotkfkdzosel@naver.com";
		String to = req.getParameter("email");
		String subject = "골라방 인증코드입니다.";
		String code = getRandomCode() + "";
		String content = "인증코드 : " + code;

		// 이메일이 있는지 확인
		JoinDAO dao = new JoinDAO();
		int result = dao.emailCheck(to);
		PrintWriter writer = resp.getWriter();
		JSONObject obj = new JSONObject();
		if (result == 1) {
			// 이미 있음.
			obj.put("result", "overlap");
			writer.print(obj);
			writer.close();
			return;
		} else {
			obj.put("result","not");
			writer.println(obj);
			writer.close();
		}
		// session에 코드 저장
		HttpSession session = req.getSession();
		session.setAttribute("code", null);
		session.setAttribute("code", code);

		Properties p = new Properties();
		p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP

		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session ses = Session.getInstance(p, auth);

			ses.setDebug(true);

			MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			msg.setSubject(subject); // 제목

			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr); // 보내는 사람

			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩

			Transport.send(msg); // 전송

		} catch (Exception e) {
			e.printStackTrace();

			writer.println("<script>alert('Send Mail Failed..');history.back();</script>");
			// 오류 발생시 뒤로 돌아가도록
			return;
		}

		writer.print("<script>alert('Send Mail Success!!');location.href='mailForm.html';</script>");
	}

	private String getRandomCode() {
		Random ran = new Random();
		String str = "";
		for (int i = 0; i < 6; i++) {
			str += ran.nextInt(10) + "";
		}
		return str;
	}
}