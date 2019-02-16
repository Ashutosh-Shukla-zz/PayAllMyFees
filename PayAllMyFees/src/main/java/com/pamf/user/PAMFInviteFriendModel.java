package com.pamf.user;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.pamf.util.PAMFEmailUtility;

public class PAMFInviteFriendModel
{

    public void inviteFriend(final String email){
        
        final String emailMessage = "<div style=\"background: none\">"
                +"  <div"
                +"      style=\"width: 560px; margin: 0 auto; border: #dfdfdf solid 1px; background: #f1f1f1\">"
                +"      <div style=\"text-align:center; line-height: 40px;\">"
                +"                      pay<span style=\"color: #089ad5;\">all</span>my<span style=\"color: #089ad5;\">fees</span>.com"
                +"                  </div>"
                +"      <div style=\"background: #f8f8f8\">"
                +"          <div"
                +"              style=\"padding: 18px 20px 25px 34px; border-bottom: #ececec solid 1px\">"
                +"              <div"
                +"                  style=\" color: #333333; font: normal 14px Arial, Helvetica, sans-serif;\">"
                +"                  <div"
                +"                      style=\"font: bold 18px Arial, Helvetica, sans-serif; margin-top: 10px; color: #042e6f; margin-bottom: 10px\">"
                +"                      Hi,</div>"
                +"                  <div style=\"font-size: 13px;text-align:center \">"
                +"                      <a href=\"dev.payallmyfees.com\">payallmyfees.com</a>, is a very useful webportal and a one print solution for all your fees payment needs."
                +"                      <br>Do check out the portal."
                +"                  </div>"
                +"              </div>"
                +"              "
                +"              <div style=\"clear: both\"></div>"
                +"          </div>"
                +"          "
                +"          <div style=\"clear: both; border-bottom: #ececec solid 1px\"></div>"
                +"          "
                +"          "
                +"      <div"
                +"          style=\"margin: 0 auto; text-align: center; margin-top: 20px; color: #9c9c9c; font: normal 13px Arial, Helvetica, sans-serif\">"
                +"          <p>"
                +"              &copy; Copyright payallmyfees.com<br> Plot No. 85,Sector-1,<br> "
                +"              Ghansoli, Maharashtra - 400701,India"
                +"          </p>"
                +"      </div>"
                +"      "
                +"  </div>"
                +"  "
                +"</div>";
        
        new Thread(new Runnable()
        {
            public void run()
            {
                try
                {
                    PAMFEmailUtility.sendEmail(email, "Password Recovery", emailMessage,"forgot");
                }
                catch (AddressException e)
                {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                catch (MessagingException e)
                {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                finally
                {

                }
            }
        }).start();
    }
}
