/*
    Document   : WelcomeTag
    Created on : Sep 8, 2018, 11:04:47 AM
    Author     : melanie roy-plommer

* @section Academic Integrity
* I certify that this work is solely my own and complies with
* NBCC Academic Integrity Policy (policy 1111)
 */
package com.nbcc;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author melan
 */
public class WelcomeTag extends SimpleTagSupport {

    /*
    *@description This is my own custom tag
    *@throws JspException
    *@throws IOException
     */

    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime today = LocalDateTime.now();
        String formatToday = today.format(formatter);

        String curDateStr = "<h3>Today is: " + formatToday + " </h3>";
        out.println(curDateStr);

        String welcomeMsg = "<p class='text'>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum varius est sem, ut pharetra "
                + "purus pellentesque sit amet. Nulla a tortor vel nunc congue ultrices. Donec nec nibh non quam hendrerit "
                + "volutpat. In congue, purus ut venenatis vehicula, augue tellus tempor sem, ac dapibus arcu odio ut quam. "
                + "Sed bibendum tortor eget posuere rutrum. Maecenas et dui eros. Phasellus quis urna nibh. Vestibulum felis "
                + "libero, semper ac sagittis molestie, dignissim id quam. Vivamus blandit magna nec felis volutpat vehicula. "
                + "Vivamus id magna a ex ultricies sodales ac ac erat. Pellentesque habitant morbi tristique senectus et netus "
                + "et malesuada fames ac turpis egestas. Aliquam quis sapien pulvinar, molestie odio eu, ultricies metus. "
                + "Sed molestie ex quis consequat pharetra. Sed et luctus neque, nec condimentum nisl. Donec elementum lobortis "
                + "augue in placerat. Sed lorem metus, blandit in neque quis, tincidunt bibendum lorem. Fusce at egestas nisi. "
                + "Integer eget mi gravida, egestas nibh quis, aliquam justo. Donec vitae turpis elit. Cras a eros sed risus "
                + "placerat tempor sed ac enim. In a blandit magna. Nulla eget justo porttitor, congue risus a, mollis leo. "
                + "Nunc ultricies ultrices mauris vitae varius. Donec quis porttitor nunc, sit amet cursus "
                + "metus. Sed vulputate condimentum urna vel efficitur. \n</p>";
        out.println(welcomeMsg);

    }
}
