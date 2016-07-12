package sixtyfour.test;

import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Map;

import sixtyfour.templating.Template;
import sixtyfour.templating.TemplateFactory;


public class TemplateTest
{
  public static void main(String[] args)
    throws Exception
  {
    testTemplate();
  }


  private static void testTemplate()
    throws Exception
  {
    Map<String, Object> vars = new HashMap<String, Object>();
    vars.put("CN", 10);
    vars.put("NA$", "Test");
    vars.put("TT$", "At least better than PHP!");
    Template templ = TemplateFactory.getTemplate(new FileInputStream("html.cbm"), vars);
    String res = templ.process();
    System.out.println(res);
    res = templ.process();
    System.out.println(res);
  }
}
