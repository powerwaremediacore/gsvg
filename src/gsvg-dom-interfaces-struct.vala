/* gsvg-dom-interfaces-struct.vala
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


public interface SVGDocument : Object,  DomDocument,
                                        DocumentEvent {
  public abstract DOMString title { get; }
  public abstract DOMString referrer { get; }
  public abstract DOMString doma{ get; }
  public abstract DOMString URL { get; }
  public abstract SVGSVGElement rootElement { get; }
}

interface SVGSVGElement : SVGElement,
                          SVGTests,
                          SVGLangSpace,
                          SVGExternalResourcesRequired,
                          SVGStylable,
                          SVGLocatable,
                          SVGFitToViewBox,
                          SVGZoomAndPan,
                          DomDocumentEvent,
                          ViewCSS,
                          DocumentCSS {

  public abstract SVGAnimatedLength x { get; }
  public abstract SVGAnimatedLength y { get; }
  public abstract SVGAnimatedLength width { get; }
  public abstract SVGAnimatedLength height { get; }
  public abstract string contentScriptType { get; set; }
  public abstract string contentStyleType { get; set; }
  public abstract SVGRect viewport { get; }
  public abstract float pixelUnitToMillimeterX { get; }
  public abstract float pixelUnitToMillimeterY { get; }
  public abstract float screenPixelToMillimeterX { get; }
  public abstract float screenPixelToMillimeterY { get; }
  public abstract bool useCurrentView { get; }
  public abstract SVGViewSpec currentView { get; }
  public abstract float currentScale { get; set; }
  public abstract SVGPoint currentTranslate { get; }

  public abstract ulong suspendRedraw(ulong maxWaitMilliseconds);
  public abstract void unsuspendRedraw(ulong suspendHandleID);
  public abstract void unsuspendRedrawAll();
  public abstract void forceRedraw();
  public abstract void pauseAnimations();
  public abstract void unpauseAnimations();
  public abstract bool animationsPaused();
  public abstract float getCurrentTime();
  public abstract void setCurrentTime(float seconds);
  public abstract NodeList getIntersectionList(SVGRect rect, SVGElement referenceElement);
  public abstract NodeList getEnclosureList(SVGRect rect, SVGElement referenceElement);
  public abstract bool checkIntersection(SVGElement element, SVGRect rect);
  public abstract bool checkEnclosure(SVGElement element, SVGRect rect);
  public abstract void deselectAll();
  public abstract SVGNumber createSVGNumber();
  public abstract SVGLength createSVGLength();
  public abstract SVGAngle createSVGAngle();
  public abstract SVGPoint createSVGPoint();
  public abstract SVGMatrix createSVGMatrix();
  public abstract SVGRect createSVGRect();
  public abstract SVGTransform createSVGTransform();
  public abstract SVGTransform createSVGTransformFromMatrix(SVGMatrix matrix);
  public abstract DomElement getElementById(DOMString elementId);
}

public interface SVGGElement : Object,
                        SVGElement,
                        SVGTests,
                        SVGLangSpace,
                        SVGExternalResourcesRequired,
                        SVGStylable,
                        SVGTransformable {
}

public interface SVGDefsElement : Object,
                             SVGElement,
                             SVGTests,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGTransformable {
}

public interface SVGDescElement : Object,
                           SVGElement,
                           SVGLangSpace,
                           SVGStylable {
}

public interface SVGTitleElement : Object,
                            SVGElement,
                            SVGLangSpace,
                            SVGStylable {
}

public interface SVGSymbolElement : Object,
                             SVGElement,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGFitToViewBox {
}

public interface SVGUseElement : SVGElement,
                          SVGURIReference,
                          SVGTests,
                          SVGLangSpace,
                          SVGExternalResourcesRequired,
                          SVGStylable,
                          SVGTransformable {
  public abstract SVGAnimatedLength x { get; }
  public abstract SVGAnimatedLength y { get; }
  public abstract SVGAnimatedLength width { get; }
  public abstract SVGAnimatedLength height { get; }
  public abstract SVGElementInstance instanceRoot { get; }
  public abstract SVGElementInstance animatedInstanceRoot { get; }
}

public interface SVGElementInstance : Object, EventTarget {
  public abstract SVGElement correspondingElement { get; }
  public abstract SVGUseElement correspondingUseElement { get; }
  public abstract SVGElementInstance parentNode { get; }
  public abstract SVGElementInstanceList childNodes { get; }
  public abstract SVGElementInstance firstChild { get; }
  public abstract SVGElementInstance lastChild { get; }
  public abstract SVGElementInstance previousSibling { get; }
  public abstract SVGElementInstance nextSibling { get; }
}

public interface SVGElementInstanceList : Object {

  public abstract ulong lengthg { get; }

  public abstract SVGElementInstance item (ulong index);
}

public interface SVGImageElement : Object,
                            SVGElement,
                            SVGURIReference,
                            SVGTests,
                            SVGLangSpace,
                            SVGExternalResourcesRequired,
                            SVGStylable,
                            SVGTransformable {
  public abstract SVGAnimatedLength x { get; }
  public abstract SVGAnimatedLength y { get; }
  public abstract SVGAnimatedLength width { get; }
  public abstract SVGAnimatedLength height { get; }
  public abstract SVGAnimatedPreserveAspectRatio preserveAspectRatio { get; }
}

public interface SVGSwitchElement : Object,
                             SVGElement,
                             SVGTests,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGTransformable {
}

public interface GetSVGDocument {
  public abstract SVGDocument getSVGDocument();
}


