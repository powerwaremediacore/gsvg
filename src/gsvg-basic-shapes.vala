/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016, 2017 Daniel Espinosa <esodan@gmail.com>
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

using GLib;
using GXml;

public class GSvg.GsTransformable : GSvg.GsCommonShapeElement,
                                  Transformable
{
  // Transformable
  public AnimatedTransformList transform { get; set; }
}

public class GSvg.GsRectElement : GSvg.GsTransformable,
                          GSvg.RectElement, MappeableElement
{
  // RectElement
  public AnimatedLengthX x { get; set; }
  [Description (nick="::x")]
  public GsAnimatedLengthX mx {
    get { return x as GsAnimatedLengthX; }
    set { x = value as AnimatedLengthX; }
  }
  public AnimatedLengthY y { get; set; }
  [Description (nick="::y")]
  public GsAnimatedLengthY my {
    get { return y as GsAnimatedLengthY; }
    set { y = value as AnimatedLengthY; }
  }
  public AnimatedLengthWidth width { get; set; }
  [Description (nick="::width")]
  public GsAnimatedLengthWidth mwidth {
    get { return width as GsAnimatedLengthWidth; }
    set { width = value as AnimatedLengthWidth; }
  }
  public AnimatedLengthHeight height{ get; set; }
  [Description (nick="::height")]
  public GsAnimatedLengthHeight mheight {
    get { return height as GsAnimatedLengthHeight; }
    set { height = value as AnimatedLengthHeight; }
  }
  public AnimatedLengthRX rx { get; set; }
  [Description (nick="::rx")]
  public GsAnimatedLengthRX mrx {
    get { return rx as GsAnimatedLengthRX; }
    set { rx = value as AnimatedLengthRX; }
  }
  public AnimatedLengthRY ry { get; set; }
  [Description (nick="::ry")]
  public GsAnimatedLengthRY mry {
    get { return ry as GsAnimatedLengthRY; }
    set { ry = value as AnimatedLengthRY; }
  }
  construct {
    initialize ("rect");
  }
  // MappeableElement
  public string get_map_key () { return id; }
}

public class GSvg.GsRectElementMap : GomHashMap, RectElementMap {
  public int length { get { return (this as GomHashMap).length; } }
  construct { initialize (typeof (GsRectElement)); }
  public RectElement RectElementMap.get (string id) {
    return (this as GomHashMap).get (id) as RectElement;
  }
}

public class GSvg.GsCircleElement : GSvg.GsTransformable,
                          GSvg.CircleElement
{
  [Description (nick="::cx")]
  public AnimatedLengthCX cx { get; set; }
  [Description (nick="::cy")]
  public AnimatedLengthCY cy { get; set; }
  [Description (nick="::r")]
  public AnimatedLengthR r { get; set; }
  construct {
    initialize ("circle");
  }
}

public class GSvg.GsEllipseElement : GSvg.GsTransformable,
                          GSvg.EllipseElement
{
  [Description (nick="::cx")]
  public AnimatedLengthCX cx  { get; set; }
  [Description (nick="::cy")]
  public AnimatedLengthCY cy { get; set; }
  [Description (nick="::rx")]
  public AnimatedLengthRX rx { get; set; }
  [Description (nick="::ry")]
  public AnimatedLengthRY ry { get; set; }
  construct {
    initialize ("ellipse");
  }
}
public class GSvg.GsLineElement : GSvg.GsTransformable,
                           GSvg.LineElement
{
  [Description (nick="::x1")]
  public AnimatedLengthX x1 { get; set; }
  [Description (nick="::y1")]
  public AnimatedLengthY y1 { get; set; }
  [Description (nick="::x2")]
  public AnimatedLengthX x2 { get; set; }
  [Description (nick="::y2")]
  public AnimatedLengthY y2 { get; set; }
  construct {
    initialize ("line");
  }
}

public class GSvg.GsAnimatedPoints : GSvg.GsTransformable,
                                    AnimatedPoints
{
  private PointList _points = new GsPointList () as PointList;
  private PointList _animated_points = new GsPointList () as PointList;
  [Description (nick="::points")]
  public PointList points { get { return _points; } }
  public PointList animated_points { get { return _animated_points; } }
}

public class GSvg.GsPolylineElement : GSvg.GsAnimatedPoints, PolylineElement {
  construct {
    initialize ("polyline");
  }
}

public class GSvg.GsPolygonElement : GSvg.GsAnimatedPoints, PolygonElement {
  construct {
    initialize ("polygon");
  }
}

