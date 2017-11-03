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

class GSvgTest.Suite : Object
{
  static int main (string args[])
  {
    GLib.Intl.setlocale (GLib.LocaleCategory.ALL, "");
    Test.init (ref args);
    Test.add_func ("/gsvg/rect/style",
    ()=>{
      try {
        var svg = new GSvg.GsSVGElement ();
        var r = svg.create_rect ("0mm","0mm","50mm","50mm", null, null);
        assert (r.style != null);
        r.style.value = "stroke-width:1mm";
        message (r.style.value);
        svg.append_child (r);
      } catch (GLib.Error e) { warning ("Error: %s".printf (e.message)); }
    });
    Test.add_func ("/gsvg/rect/read",
    ()=>{
      var svg = new GSvg.GsSVGElement ();
      string str = """<?xml version="1.0"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1e+03 3e+02" width="10cm" height="3cm"><desc>Example tspan01 - using tspan to change visual attributes</desc><g font-family="Verdana" font-size="45"><text fill="blue" x="200" y="150">You are <tspan font-weight="bold" fill="red">not</tspan> a banana</text></g><g font-family="Verdana" font-size="45"><text fill="blue" x="200" y="150">You are <tspan font-weight="bold" fill="red">not</tspan> a banana</text></g><rect id="rect" fill="none" stroke="blue" stroke-width="2" x="1" y="1" width="998" height="298" rx="20" ry="30"/></svg>""";
      svg.read_from_string (str);
      var r = svg.get_element_by_id ("rect") as RectElement;
      assert (r != null);
      assert (r is RectElement);
      assert (r.x != null);
      assert (r.x.value == "1");
      assert (r.y != null);
      assert (r.y.value == "1");
      assert (r.width != null);
      assert (r.width.value == "998");
      assert (r.height != null);
      assert (r.height.value == "298");
      assert (r.rx != null);
      assert (r.rx.value == "20");
      assert (r.ry != null);
      assert (r.ry.value == "30");
      assert (svg.rects != null);
      assert (svg.rects.get ("rect") is RectElement);
    });
    return Test.run ();
  }
}
