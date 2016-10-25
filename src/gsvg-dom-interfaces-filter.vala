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

public interface SVGFilterElement : Object, SVGElement,
                             SVGURIReference,
                             SVGLangSpace,
                             SVGExternalResourcesRequired,
                             SVGStylable,
                             SVGUnitTypes {

  public abstract SVGAnimatedEnumeration filterUnits { get; }
  public abstract SVGAnimatedEnumeration primitiveUnits { get; }
  public abstract SVGAnimatedLength x { get; }
  public abstract SVGAnimatedLength y { get; }
  public abstract SVGAnimatedLength width { get; }
  public abstract SVGAnimatedLength height { get; }
  public abstract SVGAnimatedInteger filterResX { get; }
  public abstract SVGAnimatedInteger filterResY { get; }

  void setFilterRes(in unsigned long filterResX, in unsigned long filterResY) raises(DOMException);
}

public interface SVGFilterPrimitiveStandardAttributes : Object, SVGStylable {
  public abstract SVGAnimatedLength x { get; }
  public abstract SVGAnimatedLength y { get; }
  public abstract SVGAnimatedLength width { get; }
  public abstract SVGAnimatedLength height { get; }
  public abstract SVGAnimatedString result { get; }
}

public interface SVGFEBlendElement : Object, SVGElement,
                              SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedString in2 { get; }
  public abstract SVGAnimatedEnumeration mode { get; }
}

  // Blend Mode Types
public enum SVGFeBlendMode {
  UNKNOWN = 0;
  NORMAL = 1;
  MULTIPLY = 2;
  SCREEN = 3;
  DARKEN = 4;
  LIGHTEN = 5;
}

public interface SVGFEColorMatrixElement : Object, SVGElement,
                                    SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedEnumeration type { get; }
  public abstract SVGAnimatedNumberList values { get; }
}

  // Color Matrix Types
public enum SVGFeColorMatrixType {
  UNKNOWN = 0;
  MATRIX = 1;
  SATURATE = 2;
  HUEROTATE = 3;
  LUMINANCETOALPHA = 4;
}


public interface SVGFEComponentTransferElement : Object, SVGElement,
                                          SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
}

public interface SVGComponentTransferFunctionElement : Object, SVGElement {
  public abstract SVGAnimatedEnumeration type { get; }
  public abstract SVGAnimatedNumberList tableValues { get; }
  public abstract SVGAnimatedNumber slope { get; }
  public abstract SVGAnimatedNumber intercept { get; }
  public abstract SVGAnimatedNumber amplitude { get; }
  public abstract SVGAnimatedNumber exponent { get; }
  public abstract SVGAnimatedNumber offset { get; }
}


  // Component Transfer Types
public enum SVGFeComponentTransferType {
  UNKNOWN = 0;
  IDENTITY = 1;
  TABLE = 2;
  DISCRETE = 3;
  LINEAR = 4;
  GAMMA = 5;
}


public interface SVGFEFuncRElement : Object, SVGComponentTransferFunctionElement {
}

public interface SVGFEFuncGElement : Object, SVGComponentTransferFunctionElement {
}

public interface SVGFEFuncBElement : Object, SVGComponentTransferFunctionElement {
}

public interface SVGFEFuncAElement : Object, SVGComponentTransferFunctionElement {
}

public interface SVGFECompositeElement : Object, SVGElement,
                                  SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedString in2 { get; }
  public abstract SVGAnimatedEnumeration operator { get; }
  public abstract SVGAnimatedNumber k1 { get; }
  public abstract SVGAnimatedNumber k2 { get; }
  public abstract SVGAnimatedNumber k3 { get; }
  public abstract SVGAnimatedNumber k4 { get; }
}


  // Composite Operators
public enum SVGFE0CompositeOperator {
  UNKNOWN = 0;
  OVER = 1;
  IN = 2;
  OUT = 3;
  ATOP = 4;
  XOR = 5;
  ARITHMETIC = 6;
}

public interface SVGFEConvolveMatrixElement : Object, SVGElement,
                                       SVGFilterPrimitiveStandardAttributes {

  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedInteger orderX { get; }
  public abstract SVGAnimatedInteger orderY { get; }
  public abstract SVGAnimatedNumberList kernelMatrix { get; }
  public abstract SVGAnimatedNumber divisor { get; }
  public abstract SVGAnimatedNumber bias { get; }
  public abstract SVGAnimatedInteger targetX { get; }
  public abstract SVGAnimatedInteger targetY { get; }
  public abstract SVGAnimatedEnumeration edgeMode { get; }
  public abstract SVGAnimatedNumber kernelUnitLengthX { get; }
  public abstract SVGAnimatedNumber kernelUnitLengthY { get; }
  public abstract SVGAnimatedBoolean preserveAlpha { get; }
}

  // Edge Mode Values
public enum SVGEdgeMode {
  UNKNOWN = 0;
  DUPLICATE = 1;
  WRAP = 2;
  NONE = 3;
}

public interface SVGFEDiffuseLightingElement : Object, SVGElement,
                                        SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedNumber surfaceScale { get; }
  public abstract SVGAnimatedNumber diffuseConstant { get; }
  public abstract SVGAnimatedNumber kernelUnitLengthX { get; }
  public abstract SVGAnimatedNumber kernelUnitLengthY { get; }
}

public interface SVGFEDistantLightElement : Object, SVGElement {
  public abstract SVGAnimatedNumber azimuth { get; }
  public abstract SVGAnimatedNumber elevation { get; }
}

public interface SVGFEPointLightElement : Object, SVGElement {
  public abstract SVGAnimatedNumber x { get; }
  public abstract SVGAnimatedNumber y { get; }
  public abstract SVGAnimatedNumber z { get; }
}

public interface SVGFESpotLightElement : Object, SVGElement {
  public abstract SVGAnimatedNumber x { get; }
  public abstract SVGAnimatedNumber y { get; }
  public abstract SVGAnimatedNumber z { get; }
  public abstract SVGAnimatedNumber pointsAtX { get; }
  public abstract SVGAnimatedNumber pointsAtY { get; }
  public abstract SVGAnimatedNumber pointsAtZ { get; }
  public abstract SVGAnimatedNumber specularExponent { get; }
  public abstract SVGAnimatedNumber limitingConeAngle { get; }
}

public interface SVGFEDisplacementMapElement : Object, SVGElement,
                                        SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedString in2 { get; }
  public abstract SVGAnimatedNumber scale { get; }
  public abstract SVGAnimatedEnumeration xChannelSelector { get; }
  public abstract SVGAnimatedEnumeration yChannelSelector { get; }
}

  // Channel Selectors
public enum SVGChannel {
  UNKNOWN = 0;
  R = 1;
  G = 2;
  B = 3;
  A = 4;
}


public interface SVGFEFloodElement : Object, SVGElement,
                              SVGFilterPrimitiveStandardAttributes {
}

public interface SVGFEGaussianBlurElement : Object, SVGElement,
                                     SVGFilterPrimitiveStandardAttributes {

  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedNumber stdDeviationX { get; }
  public abstract SVGAnimatedNumber stdDeviationY { get; }

  void setStdDeviation(in float stdDeviationX, in float stdDeviationY) raises(DOMException);
}

public interface SVGFEImageElement : Object, SVGElement,
                              SVGURIReference,
                              SVGLangSpace,
                              SVGExternalResourcesRequired,
                              SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedPreserveAspectRatio preserveAspectRatio { get; }
}

public interface SVGFEMergeElement : Object, SVGElement,
                              SVGFilterPrimitiveStandardAttributes {
}

public interface SVGFEMergeNodeElement : Object, SVGElement {
  public abstract SVGAnimatedString in1 { get; }
}

public interface SVGFEMorphologyElement : Object, SVGElement,
                                   SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedEnumeration operator { get; }
  public abstract SVGAnimatedNumber radiusX { get; }
  public abstract SVGAnimatedNumber radiusY { get; }
}


  // Morphology Operators
public enum SVGMorphologyOperator {
  UNKNOWN = 0;
  ERODE = 1;
  DILATE = 2;
}

public interface SVGFEOffsetElement : Object, SVGElement,
                               SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedNumber dx { get; }
  public abstract SVGAnimatedNumber dy { get; }
}

public interface SVGFESpecularLightingElement : Object, SVGElement,
                                         SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
  public abstract SVGAnimatedNumber surfaceScale { get; }
  public abstract SVGAnimatedNumber specularConstant { get; }
  public abstract SVGAnimatedNumber specularExponent { get; }
  public abstract SVGAnimatedNumber kernelUnitLengthX { get; }
  public abstract SVGAnimatedNumber kernelUnitLengthY { get; }
}

public interface SVGFETileElement : Object, SVGElement,
                             SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedString in1 { get; }
}

public interface SVGFETurbulenceElement : Object, SVGElement,
                                   SVGFilterPrimitiveStandardAttributes {
  public abstract SVGAnimatedNumber baseFrequencyX { get; }
  public abstract SVGAnimatedNumber baseFrequencyY { get; }
  public abstract SVGAnimatedInteger numOctaves { get; }
  public abstract SVGAnimatedNumber seed { get; }
  public abstract SVGAnimatedEnumeration stitchTiles { get; }
  public abstract SVGAnimatedEnumeration type { get; }
}


  // Turbulence Types
public enum SVGTurbulenceType {
  UNKNOWN = 0;
  FRACTALNOISE = 1;
  TURBULENCE = 2;
}
  // Stitch Options
public enum SVGStichType {
  UNKNOWN = 0;
  STITCH = 1;
  NOSTITCH = 2;
}


