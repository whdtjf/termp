package lab;

import java.util.Date;
import java.io.Serializable;

public class Member implements Serializable{
   private String lecture;

   public String getLecture() {   //getter methods
      return lecture;
   }
 
	   public void setLecture(String lecture) {   //setter methods
	      this.lecture = lecture;
	   }

	}
