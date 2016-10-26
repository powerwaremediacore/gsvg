/* gsvg-dom-public interfaces-filter.vala
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

namespace GSvg {

public interface FilterElement : Object, Element,
                             URIReference,
                             LangSpace,
                             ExternalResourcesRequired,
                             Stylable {

  public abstract AnimatedEnumeration filterUnits { get; }
  public abstract AnimatedEnumeration primitiveUnits { get; }
  public abstract AnimatedLength x { get; }
  public abstract AnimatedLength y { get; }
  public abstract AnimatedLength width { get; }
  public abstract AnimatedLength height { get; }
  public abstract AnimatedInteger filterResX { get; }
  public abstract AnimatedInteger filterResY { get; }

  public abstract void setFilterRes(uint filterResX, uint filterResY) throws GLib.Error;
}

public interface FilterPrimitiveStandardAttributes : Object, Stylable {
  public abstract AnimatedLength x { get; }
  public abstract AnimatedLength y { get; }
  public abstract AnimatedLength width { get; }
  public abstract AnimatedLength height { get; }
  public abstract AnimatedString result { get; }
}

public interface FEBlendElement : Object, Element,
                              FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedString in2 { get; }
  public abstract AnimatedEnumeration mode { get; }
}

  // Blend Mode Types
public enum FEBlendMode {
  UNKNOWN = 0,
  NORMAL = 1,
  MULTIPLY = 2,
  SCREEN = 3,
  DARKEN = 4,
  LIGHTEN = 5
}

public interface FEColorMatrixElement : Object, Element,
                                    FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedEnumeration cm_type { get; }
  public abstract AnimatedNumberList values { get; }
}

  // Color Matrix Types
public enum FEColorMatrixType {
  UNKNOWN = 0,
  MATRIX = 1,
  SATURATE = 2,
  HUEROTATE = 3,
  LUMINANCETOALPHA = 4
}


public interface FEComponentTransferElement : Object, Element,
                                          FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
}

public interface ComponentTransferFunctionElement : Object, Element {
  public abstract AnimatedEnumeration ctf_type { get; }
  public abstract AnimatedNumberList tableValues { get; }
  public abstract AnimatedNumber slope { get; }
  public abstract AnimatedNumber intercept { get; }
  public abstract AnimatedNumber amplitude { get; }
  public abstract AnimatedNumber exponent { get; }
  public abstract AnimatedNumber offset { get; }
}


  // Component Transfer Types
public enum FEComponentTransferType {
  UNKNOWN = 0,
  IDENTITY = 1,
  TABLE = 2,
  DISCRETE = 3,
  LINEAR = 4,
  GAMMA = 5
}


public interface FEFuncRElement : Object, ComponentTransferFunctionElement {
}

public interface FEFuncGElement : Object, ComponentTransferFunctionElement {
}

public interface FEFuncBElement : Object, ComponentTransferFunctionElement {
}

public interface FEFuncAElement : Object, ComponentTransferFunctionElement {
}

public interface FECompositeElement : Object,
                                  Element,
                                  FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedString in2 { get; }
  public abstract AnimatedEnumeration operator { get; }
  public abstract AnimatedNumber k1 { get; }
  public abstract AnimatedNumber k2 { get; }
  public abstract AnimatedNumber k3 { get; }
  public abstract AnimatedNumber k4 { get; }
}


  // Composite Operators
public enum FE0CompositeOperator {
  UNKNOWN = 0,
  OVER = 1,
  IN = 2,
  OUT = 3,
  ATOP = 4,
  XOR = 5,
  ARITHMETIC = 6,
}

public interface FEConvolveMatrixElement : Object,
                                      Element,
                                      FilterPrimitiveStandardAttributes {

  public abstract AnimatedString in1 { get; }
  public abstract AnimatedInteger orderX { get; }
  public abstract AnimatedInteger orderY { get; }
  public abstract AnimatedNumberList kernelMatrix { get; }
  public abstract AnimatedNumber divisor { get; }
  public abstract AnimatedNumber bias { get; }
  public abstract AnimatedInteger targetX { get; }
  public abstract AnimatedInteger targetY { get; }
  public abstract AnimatedEnumeration edgeMode { get; }
  public abstract AnimatedNumber kernelUnitLengthX { get; }
  public abstract AnimatedNumber kernelUnitLengthY { get; }
  public abstract AnimatedBoolean preserveAlpha { get; }
}

  // Edge Mode Values
public enum EdgeMode {
  UNKNOWN = 0,
  DUPLICATE = 1,
  WRAP = 2,
  NONE = 3
}

public interface FEDiffuseLightingElement : Object,
                                        Element,
                                        FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedNumber surfaceScale { get; }
  public abstract AnimatedNumber diffuseConstant { get; }
  public abstract AnimatedNumber kernelUnitLengthX { get; }
  public abstract AnimatedNumber kernelUnitLengthY { get; }
}

public interface FEDistantLightElement : Object, Element {
  public abstract AnimatedNumber azimuth { get; }
  public abstract AnimatedNumber elevation { get; }
}

public interface FEPointLightElement : Object, Element {
  public abstract AnimatedNumber x { get; }
  public abstract AnimatedNumber y { get; }
  public abstract AnimatedNumber z { get; }
}

public interface FESpotLightElement : Object, Element {
  public abstract AnimatedNumber x { get; }
  public abstract AnimatedNumber y { get; }
  public abstract AnimatedNumber z { get; }
  public abstract AnimatedNumber pointsAtX { get; }
  public abstract AnimatedNumber pointsAtY { get; }
  public abstract AnimatedNumber pointsAtZ { get; }
  public abstract AnimatedNumber specularExponent { get; }
  public abstract AnimatedNumber limitingConeAngle { get; }
}

public interface FEDisplacementMapElement : Object, Element,
                                        FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedString in2 { get; }
  public abstract AnimatedNumber scale { get; }
  public abstract AnimatedEnumeration xChannelSelector { get; }
  public abstract AnimatedEnumeration yChannelSelector { get; }
}

  // Channel Selectors
public enum Channel {
  UNKNOWN = 0,
  R = 1,
  G = 2,
  B = 3,
  A = 4
}


public interface FEFloodElement : Object, Element,
                              FilterPrimitiveStandardAttributes {
}

public interface FEGaussianBlurElement : Object, Element,
                                     FilterPrimitiveStandardAttributes {

  public abstract AnimatedString in1 { get; }
  public abstract AnimatedNumber stdDeviationX { get; }
  public abstract AnimatedNumber stdDeviationY { get; }

  public abstract void setStdDeviation(float stdDeviationX, float stdDeviationY) throws GLib.Error;
}

public interface FEImageElement : Object, Element,
                              URIReference,
                              LangSpace,
                              ExternalResourcesRequired,
                              FilterPrimitiveStandardAttributes {
  public abstract AnimatedPreserveAspectRatio preserveAspectRatio { get; }
}

public interface FEMergeElement : Object, Element,
                              FilterPrimitiveStandardAttributes {
}

public interface FEMergeNodeElement : Object, Element {
  public abstract AnimatedString in1 { get; }
}

public interface FEMorphologyElement : Object, Element,
                                   FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedEnumeration operator { get; }
  public abstract AnimatedNumber radiusX { get; }
  public abstract AnimatedNumber radiusY { get; }
}


  // Morphology Operators
public enum MorphologyOperator {
  UNKNOWN = 0,
  ERODE = 1,
  DILATE = 2
}

public interface FEOffsetElement : Object, Element,
                               FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedNumber dx { get; }
  public abstract AnimatedNumber dy { get; }
}

public interface FESpecularLightingElement : Object, Element,
                                         FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
  public abstract AnimatedNumber surfaceScale { get; }
  public abstract AnimatedNumber specularConstant { get; }
  public abstract AnimatedNumber specularExponent { get; }
  public abstract AnimatedNumber kernelUnitLengthX { get; }
  public abstract AnimatedNumber kernelUnitLengthY { get; }
}

public interface FETileElement : Object, Element,
                             FilterPrimitiveStandardAttributes {
  public abstract AnimatedString in1 { get; }
}

public interface FETurbulenceElement : Object, Element,
                                   FilterPrimitiveStandardAttributes {
  public abstract AnimatedNumber baseFrequencyX { get; }
  public abstract AnimatedNumber baseFrequencyY { get; }
  public abstract AnimatedInteger numOctaves { get; }
  public abstract AnimatedNumber seed { get; }
  public abstract AnimatedEnumeration stitchTiles { get; }
  public abstract AnimatedEnumeration ttype { get; }
}


  // Turbulence Types
public enum TurbulenceType {
  UNKNOWN = 0,
  FRACTALNOISE = 1,
  TURBULENCE = 2
}
  // Stitch Options
public enum StichType {
  UNKNOWN = 0,
  STITCH = 1,
  NOSTITCH = 2
}

} // GSvg
