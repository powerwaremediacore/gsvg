/* -*- Mode: vala; indent-tabs-mode: nil; c-basic-offset: 2; tab-width: 2 -*- */
/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016 Daniel Espinosa
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
    message ("construct rect");
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
  protected AnimatedLengthCX _cx;
  protected AnimatedLengthCY _cy;
  protected AnimatedLengthRX _rx;
  protected AnimatedLengthRY _ry;
  // RectElement
  public AnimatedLengthCX cx {
    get { return _cx; } construct set { _cx = value; }
  }
  public AnimatedLengthCY cy {
    get { return _cy; } construct set { _cy = value; }
  }
  public AnimatedLengthRX rx {
    get { return _rx; } construct set { _rx = value; }
  }
  public AnimatedLengthRY ry {
    get { return _ry; } construct set { _ry = value; }
  }
  construct {
    _local_name = "ellipse";
  }
  public GsEllipseElement.initialize (GSvg.GsSvg parent,
                          string? cx,
                          string? cy,
                          string? rx,
                          string? ry) {
    _document = parent.owner_document;
    if (cx != null) {
        _cx = new GsAnimatedLengthCX () as AnimatedLengthCX;
        (_cx.base_val as GsLength).parse (cx);
    }
    if (cy != null) {
      _cy = new GsAnimatedLengthCY () as AnimatedLengthCY;
      (_cy.base_val as GsLength).parse (cy);
    }
    if (rx != null) {
      _rx = new GsAnimatedLengthRX () as AnimatedLengthRX;
      (_rx.base_val as GsLength).parse (rx);
     }
    if (ry != null) {
      _ry = new GsAnimatedLengthRY () as AnimatedLengthRY;
      (_ry.base_val as GsLength).parse (ry);
    }
  }
}
