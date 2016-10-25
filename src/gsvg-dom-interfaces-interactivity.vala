/* gsvg-dom-public public interfaces-filter.vala
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

public interface SVGCursorElement : Object, SVGElement,
                             SVGURIReference,
                             SVGTests,
                             SVGExternalResourcesRequired {
  public abstract SVGAnimatedLength x { get; }
  public abstract SVGAnimatedLength y { get; }
}

public interface SVGAElement : Object, SVGElement,
                        SVGURIReference,
                        SVGTests,
                        SVGLangSpace,
                        SVGExternalResourcesRequired,
                        SVGStylable,
                        SVGTransformable {
  public abstract SVGAnimatedString target { get; }
}

public interface SVGViewElement : Object, SVGElement,
                           SVGExternalResourcesRequired,
                           SVGFitToViewBox,
                           SVGZoomAndPan {
  public abstract SVGStringList viewTarget { get; }
}

public interface SVGScriptElement : Object, SVGElement,
                             SVGURIReference,
                             SVGExternalResourcesRequired {
  public abstract string type { get; set; }
}

public interface SVGZoomEvent : Object/*, UIEvent*/ {
  public abstract SVGRect zoomRectScreen { get; }
  public abstract float previousScale { get; }
  public abstract SVGPoint previousTranslate { get; }
  public abstract float newScale { get; }
  public abstract SVGPoint newTranslate { get; }
}

public interface ElementTimeControl {
  public abstract void beginElement();
  public abstract void beginElementAt(float offset);
  public abstract void endElement();
  public abstract void endElementAt(float offset);
}

public interface TimeEvent : Object, Event {

  public abstract AbstractView view { get; }
  public abstract long detail { get; }

  void initTimeEvent(string typeArg, AbstractView viewArg, long detailArg);
}

public interface SVGAnimationElement : Object, SVGElement,
                                SVGTests,
                                SVGExternalResourcesRequired,
                                ElementTimeControl {

  public abstract SVGElement targetElement { get; }

  public abstract float getStartTime()throws GLib.Error;
  public abstract float getCurrentTime();
  public abstract float getSimpleDuration()throws GLib.Error;
}

public interface SVGAnimateElement : Object, SVGAnimationElement,
                              SVGStylable {
}

public interface SVGSetElement : Object, SVGAnimationElement {
}

public interface SVGAnimateMotionElement : Object, SVGAnimationElement {
}

public interface SVGMPathElement : Object, SVGElement,
                            SVGURIReference,
                            SVGExternalResourcesRequired {
}

public interface SVGAnimateColorElement : Object, SVGAnimationElement,
                                   SVGStylable {
}

public interface SVGAnimateTransformElement : Object, SVGAnimationElement {
}


