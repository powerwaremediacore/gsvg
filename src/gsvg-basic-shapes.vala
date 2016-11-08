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
  protected AnimatedLength _x;
  protected AnimatedLength _y;
  protected AnimatedLength _width;
  protected AnimatedLength _height;
  protected AnimatedLength _rx;
  protected AnimatedLength _ry;
  // RectElement
  [Description (nick="::x")]
  public AnimatedLength x {
    get { return _x; } construct set { _x = value; }
  }
  [Description (nick="::x")]
  public AnimatedLength y {
    get { return _y; } construct set { _y = value; }
  }
  [Description (nick="::width")]
  public AnimatedLength width {
    get { return _width; } construct set { _width = value; }
  }
  [Description (nick="::height")]
  public AnimatedLength height{
    get { return _height; } construct set { _height = value; }
  }
  [Description (nick="::rx")]
  public AnimatedLength rx {
    get { return _rx; } construct set { _rx = value; }
  }
  [Description (nick="::ry")]
  public AnimatedLength ry {
    get { return _ry; } construct set { _ry = value; }
  }
  construct {
    _local_name = "rect";
  }
  public GsRectElement.initialize (GSvg.GsSvg parent,
                          AnimatedLength? x,
                          AnimatedLength? y,
                          AnimatedLength? width,
                          AnimatedLength? height,
                          AnimatedLength? rx,
                          AnimatedLength? ry) {
    _document = parent.owner_document;
    _x = x;
    _y = y;
    _width = width;
    _height = height;
    _rx = rx;
    _ry = ry;
  }
}
