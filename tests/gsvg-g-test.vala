/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*-  */
/*
 * gsvg-test.vala

 * Copyright (C) 2017 Daniel Espinosa <daniel.espinosa@pwmc.mx>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using GSvg;
using GXml;

class GSvgTest.Suite : Object
{
  static int main (string args[])
  {
    GLib.Intl.setlocale (GLib.LocaleCategory.ALL, "");
    Test.init (ref args);
    Test.add_func ("/gsvg/g/init",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
        var g = svg.add_g ();
        var t = svg.create_text ("HELLO WORLD", "0", "0", "10", "10", "0");
        g.append_child (t);
        message (svg.write_string ());
        assert ("<svg xmlns=\"http://www.w3.org/2000/svg\"><g><text x=\"0\" y=\"0\" dx=\"10\" dy=\"10\" rotate=\"0\">HELLO WORLD</text></g></svg>" in svg.write_string ());
      } catch (GLib.Error e) { warning ("Error: %s".printf (e.message)); }
    });
    Test.add_func ("/gsvg/g/container",
    ()=>{
      try {
        string str = """<svg xmlns="http://www.w3.org/2000/svg"><g id="g1"><text x="0" y="0" dx="10" dy="10" rotate="0">HELLO WORLD</text></g><g id="gsecond"><svg id="second" xmlns="http://www.w3.org/2000/svg"><g id="g2"><text x="0" y="0" dx="10" dy="10" rotate="0">HELLO WORLD</text></g></svg></g></svg>""";
        var svg = new GSvg.GsDocument () as GSvg.Document;
        svg.read_from_string (str);
        message (svg.write_string ());
        var g = svg.get_element_by_id ("gsecond") as GSvg.GElement;
        assert (g != null);
        assert (g is ContainerElement);
        assert (g.svgs != null);
        message (g.svgs.length.to_string ());
        assert (g.svgs.length == 1);
        var s = g.svgs.get ("second") as SVGElement;
        assert (s != null);
        assert (s is SVGElement);
      } catch (GLib.Error e) { warning ("Error: %s".printf (e.message)); }
    });
    return Test.run ();
  }
}
