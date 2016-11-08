/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * pwmui-object-editor.vala
 * Copyright (C) 2015 Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 */

using GSvg;
using GXml;

public class GSvgTest.SvgTest {
  public static void add_funcs ()
  {
    Test.add_func ("/gsvg/svg/construct/default",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
    });
    Test.add_func ("/gsvg/svg/construct/initialize",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var parser = new XParser (svg);
      string s = parser.write_string ();
      assert (s != null);
      GLib.message ("SVG: "+s);
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"/>" in s);
    });
  }
}
