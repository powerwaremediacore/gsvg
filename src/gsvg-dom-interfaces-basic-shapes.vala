/* gsvg-dom-interfaces-basic-shapes.vala
 *
 * Copyright (C) 2016 Daniel Espinosa <daniel.espinosa@pwmc.mx>
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

public interface SVGRectElement : Object,
                           SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGTransformable {
  public abstract SVGAnimatedLength x { get; }
  public abstract SVGAnimatedLength y { get; }
  public abstract SVGAnimatedLength width { get; }
  public abstract SVGAnimatedLength height { get; }
  public abstract SVGAnimatedLength rx { get; }
  public abstract SVGAnimatedLength ry { get; }
}

public interface SVGCircleElement : Object,
                             SVGElement,
                             SVGTests,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGTransformable {
  public abstract SVGAnimatedLength cx { get; }
  public abstract SVGAnimatedLength cy { get; }
  public abstract SVGAnimatedLength r { get; }
}

public interface SVGEllipseElement : Object,
                              SVGElement,
                              SVGTests,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGStylable,
                              SVGTransformable {
  public abstract SVGAnimatedLength cx { get; }
  public abstract SVGAnimatedLength cy { get; }
  public abstract SVGAnimatedLength rx { get; }
  public abstract SVGAnimatedLength ry { get; }
}

public interface SVGLineElement : Object,
                           SVGElement,
                           SVGTests,
                           SVGLangSpace,
                           SVGExternalResourcesRequired,
                           SVGStylable,
                           SVGTransformable {
  public abstract SVGAnimatedLength x1 { get; }
  public abstract SVGAnimatedLength y1 { get; }
  public abstract SVGAnimatedLength x2 { get; }
  public abstract SVGAnimatedLength y2 { get; }
}

public interface SVGAnimatedPoints : Object {
  public abstract SVGPointList points { get; }
  public abstract SVGPointList animatedPoints { get; }
}

public interface SVGPolylineElement : Object,
                               SVGElement,
                               SVGTests,
                               SVGLangSpace,
                               SVGExternalResourcesRequired,
                               SVGStylable,
                               SVGTransformable,
                               SVGAnimatedPoints {
}

public interface SVGPolygonElement : Object,
                              SVGElement,
                              SVGTests,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGStylable,
                              SVGTransformable,
                              SVGAnimatedPoints {
}
