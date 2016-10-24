/* gsvg-dom-element.vala
 *
 * Copyright (C) 2016 Daniel Espinosa
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;
using GXml;

/**
 * Top level SVG node according with https://www.w3.org/TR/SVG/ version 1.1
 */
public interface GSvg.SVGElement : Object, DomElement {
  public abstract string id { get; }
  public abstract string xmlbase { get; }
  public abstract SVGSVGElement ownerSVGElement { get; }
  public abstract SVGElement viewportElement { get; }
}

public interface GSvg.SVGAnimatedBoolean Object, {
  public abstract bool baseVal { get; }
  public abstract bool animVal { get; }
}

public interface GSvg.SVGAnimatedString : Object {
           attribute DOMString baseVal setraises(DOMException);
  readonly attribute DOMString animVal;
}

public interface GSvg.SVGStringList : Object {

  public abstract uint numberOfItems { get; }
  public abstract void clear () throws GLib.Error;
  public abstract string initialize (string newItem) throws GLib.Error;
  public abstract string getItem (int index) throws GLib.Error;
  public abstract string insertItemBefore (in DOMString newItem, in unsigned long index) throws GLib.Error;
  public abstract string replaceItem (string newItem, in unsigned long index) throws GLib.Error;
  public abstract string removeItem (int index) throws GLib.Error;
  public abstract string appendItem (string newItem) throws GLib.Error;
}


public interface GSvg.SVGAnimatedEnumeration : Object {
  public abstract uint baseVal { get; }
  public abstract uint animVal { get; }
}

public interface GSvg.SVGAnimatedInteger : Object {
  public abstract long baseVal { get; }
  public abstract long animVal { get; }
}

public interface GSvg.SVGNumber : Object {
  public abstract float value { get; }
}

public interface GSvg.SVGAnimatedNumber : Object {
  public abstract float baseVal { get; }
  public abstract float animVal  { get; }
}

public interface GSvg.SVGNumberList : Object {

  public abstract ulong numberOfItems;

  public abstract void clear() { get; }
  public abstract SVGNumber initialize(SVGNumber newItem) throws GLib.Error;
  public abstract SVGNumber getItem(ulong index) throws GLib.Error;
  public abstract SVGNumber insertItemBefore(SVGNumber newItem, in unsigned long index) throws GLib.Error;
  public abstract SVGNumber replaceItem(SVGNumber newItem, in unsigned long index) throws GLib.Error;
  public abstract SVGNumber removeItem(ulong index) throws GLib.Error;
  public abstract SVGNumber appendItem(SVGNumber newItem) throws GLib.Error;
}

public interface GSvg.SVGAnimatedNumberList : Object {
  public abstract SVGNumberList baseVal { get; }
  public abstract SVGNumberList animVal { get; }
}
