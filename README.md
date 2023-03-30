# FlexExtract

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://tcarion.github.io/FlexExtract.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://tcarion.github.io/FlexExtract.jl/dev/)
[![Build Status](https://github.com/tcarion/FlexExtract.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/tcarion/FlexExtract.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/tcarion/FlexExtract.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/tcarion/FlexExtract.jl)

## Description
FlexExtract.jl is a package interfacing the [flex_extract](https://www.flexpart.eu/flex_extract/) program in Julia, allowing to retrieve and prepare the ECMWF input meteorological data for the [FLEXPART](https://www.flexpart.eu/) Lagrangian atmospheric dispersion model.

## Getting started
First, install the package via:

```julia
using Pkg; Pkg.add(url="https://github.com/tcarion/FlexExtract.jl")
```

Then, create a default FlexExtract directory in the current directory:

```julia
using FlexExtract
FlexExtract.create("testfe")
```

This will create a new directory called `testfe` with two subdirectories `input` and `output`, as well as a default control file (see the [flex_extract](https://www.flexpart.eu/flex_extract/) documentation for more info about the control file). To check the values of the control file in Julia, type:

```julia
julia> fcontrol = FeControl(fedir)
OrderedCollections.OrderedDict{Symbol, Any} with 18 entries:
  :START_DATE => "20180809"
  :DTIME      => "1"
  :TYPE       => "AN FC FC FC FC FC FC FC FC FC FC FC AN FC FC FC FC FC FC FC FC FC FC FC"
  :TIME       => "00 00 00 00 00 00 00 00 00 00 00 00 12 12 12 12 12 12 12 12 12 12 12 12"
  :STEP       => "00 01 02 03 04 05 06 07 08 09 10 11 00 01 02 03 04 05 06 07 08 09 10 11"
  :CLASS      => "OD"
  :STREAM     => "OPER"
  :GRID       => "0.2  "
  :LEFT       => "-10."
  :LOWER      => "30."
  :UPPER      => "60."
  :RIGHT      => "30."
  :LEVEL      => "137"
  :RESOL      => "799"
  :ETA        => "1"
  :FORMAT     => "GRIB2"
  :PREFIX     => "ENH"
  :ECTRANS    => "1"
```

You can change any paraemeters with `setindex!`. You then need to write the modified values to the file with `FlexExtract.save`:

```julia
fcontrol[:GRID] = 0.5
FlexExtract.save(fcontrol)
```

After the parameters have been set, you can send the request to ECMWF servers via:

```julia
FlexExtract.submit(fedir)
```
