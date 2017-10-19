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

public class GSvg.GsTransformable : GSvg.GsCommonElement,
                                  Transformable
{
  protected AnimatedTransformList _transform;
  // Transformable
  public AnimatedTransformList transform { get { return _transform; } }
}

public class GSvg.GsRectElement : GSvg.GsTransformable,
                          GSvg.RectElement
{
  // RectElement
  [Description (nick="::x")]
  public AnimatedLengthX x { get; set; }
  [Description (nick="::y")]
  public AnimatedLengthY y { get; set; }
  [Description (nick="::width")]
  public AnimatedLengthWidth width { get; set; }
  [Description (nick="::height")]
  public AnimatedLengthHeight height{ get; set; }
  [Description (nick="::rx")]
  public AnimatedLengthRX rx { get; set; }
  [Description (nick="::ry")]
  public AnimatedLengthRY ry { get; set; }
  construct {
    initialize ("rect");
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
