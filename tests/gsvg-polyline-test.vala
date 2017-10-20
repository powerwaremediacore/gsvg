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
    Test.add_func ("/gsvg/polyline/point",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var p1 = new GsPoint ();
      p1.parse ("1,2");
      assert ("%.2f".printf (p1.x) == "%.2f".printf (1.0));
      assert ("%.2f".printf (p1.y) == "%.2f".printf (2.0));
      assert ("1,2" == p1.to_string ());
    });
    Test.add_func ("/gsvg/polyline/points",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var p1 = new GsPoint () as Point;
      p1.parse ("1,2");
      var p2 = new GsPoint () as Point;
      p2.parse ("4,6");
      var points = new GsPointList ();
      points.add (p1);
      points.add (p2);
      assert ("1,2 4,6" == points.value);
    });
    Test.add_func ("/gsvg/polyline/init",
    ()=>{
      var svg = new GSvg.GsSvg ();
      var p1 = new GsPoint () as Point;
      p1.parse ("1,2");
      var p2 = new GsPoint () as Point;
      p2.parse ("4,6");
      var p3 = new GsPoint () as Point;
      p3.parse ("7,9");
      var points = new GLib.Queue<Point> ();
      points.push_tail (p1);
      points.push_tail (p2);
      points.push_tail (p3);
      var pl = svg.create_polyline (points);
      assert (pl is DomElement);
      assert (pl.points != null);
      assert (pl.points.value != null);
      svg.append_child (pl);
      message (svg.write_string ());
      assert ("<svg xmlns:svg=\"http://www.w3.org/2000/svg\"><polyline points=\"1,2 4,6 7,9\"/></svg>" in svg.write_string ());
    });
    return Test.run ();
  }
}
