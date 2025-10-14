# Zolygon

**Zolygon** is a next-generation open-source geometry kernel written in **Zig**.  
It unifies **NURBS-based CAD solids** and **mesh-based DCC geometry** under one clean, high-performance architecture.

---

## Vision

> Build a modern, open geometry engine that is as precise as a CAD kernel  
> and as fluid as a DCC modeling core.

Zolygon bridges two worlds:

| CAD Domain | DCC Domain |
|-------------|-------------|
| NURBS, B-Rep solids | Meshes, subdivision surfaces |
| Parametric precision | Artistic flexibility |
| STEP / IGES formats | glTF / USD formats |

The goal: enable **exact and expressive** modeling in the same scene.

zolygon/
├── README.md
├── LICENSE
├── build.zig
├── build.zig.zon
├── .gitignore
├── .editorconfig
├── .gitattributes
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── CHANGELOG.md
│
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   ├── bug_report.md
│   │   └── feature_request.md
│   └── workflows/
│       ├── ci.yml
│       ├── lint.yml
│       └── release.yml
│
├── include/
│   └── zolygon.h                    # Generated public C header
│
├── docs/
│   ├── architecture.md
│   ├── roadmap.md
│   ├── style-guide.md
│   ├── adr/
│   ├── api/
│   │   └── c_api_reference.md
│   ├── hosts/
│   │   ├── blender.md
│   │   ├── freecad.md
│   │   └── plasticity.md
│   └── design/
│       ├── nurbs-eval.md
│       ├── boolean-kernel.md
│       ├── sewing-healing.md
│       └── tessellation.md
│
├── src/
│   ├── main.zig
│   │
│   ├── runtime/
│   │   ├── context.zig
│   │   ├── config.zig
│   │   ├── logging.zig
│   │   ├── telemetry.zig
│   │   ├── profiling.zig
│   │   └── units.zig
│   │
│   ├── core/
│   │   ├── math/
│   │   │   ├── vec.zig
│   │   │   ├── mat.zig
│   │   │   ├── quat.zig
│   │   │   ├── bbox.zig
│   │   │   └── basis.zig
│   │   ├── numerics/
│   │   │   ├── predicates.zig
│   │   │   ├── roots.zig
│   │   │   ├── interval.zig
│   │   │   └── integrate.zig
│   │   ├── allocator.zig
│   │   ├── tolerance.zig
│   │   └── ids.zig
│   │
│   ├── geom/
│   │   ├── analytic/
│   │   │   ├── line.zig
│   │   │   ├── plane.zig
│   │   │   ├── cone.zig
│   │   │   ├── cylinder.zig
│   │   │   ├── sphere.zig
│   │   │   └── torus.zig
│   │   ├── nurbs/
│   │   │   ├── curve.zig
│   │   │   ├── surface.zig
│   │   │   ├── knots.zig
│   │   │   ├── trim.zig
│   │   │   └── eval.zig
│   │   ├── brep/
│   │   │   ├── vertex.zig
│   │   │   ├── edge.zig
│   │   │   ├── wire.zig
│   │   │   ├── face.zig
│   │   │   ├── shell.zig
│   │   │   ├── solid.zig
│   │   │   └── topology_utils.zig
│   │   └── mesh/
│   │       ├── mesh.zig
│   │       ├── halfedge.zig
│   │       ├── subdiv.zig
│   │       ├── bvh.zig
│   │       └── attr.zig
│   │
│   ├── ops/
│   │   ├── construct/
│   │   │   ├── extrude.zig
│   │   │   ├── revolve.zig
│   │   │   ├── loft.zig
│   │   │   ├── sweep.zig
│   │   │   └── patch.zig
│   │   ├── modify/
│   │   │   ├── offset.zig
│   │   │   ├── fillet.zig
│   │   │   ├── chamfer.zig
│   │   │   └── draft.zig
│   │   ├── intersect/
│   │   │   ├── curve_curve.zig
│   │   │   ├── curve_surface.zig
│   │   │   ├── surface_surface.zig
│   │   │   └── mesh_intersect.zig
│   │   ├── boolean/
│   │   │   ├── classify.zig
│   │   │   ├── split_faces.zig
│   │   │   └── boolean_solid.zig
│   │   ├── sew_heal/
│   │   │   ├── sew.zig
│   │   │   └── heal.zig
│   │   ├── tess/
│   │   │   ├── tess_face.zig
│   │   │   ├── tess_solid.zig
│   │   │   ├── curvature_eval.zig
│   │   │   └── uv_pack.zig
│   │   └── project/
│   │       ├── project_curve.zig
│   │       └── reparam.zig
│   │
│   ├── accel/
│   │   ├── bvh.zig
│   │   ├── kdtree.zig
│   │   ├── grid.zig
│   │   └── spatial_hash.zig
│   │
│   ├── io/
│   │   ├── step/
│   │   │   ├── reader.zig
│   │   │   └── writer.zig
│   │   ├── iges/
│   │   │   ├── reader.zig
│   │   │   └── writer.zig
│   │   ├── stl/
│   │   │   ├── reader.zig
│   │   │   └── writer.zig
│   │   ├── obj/
│   │   │   ├── reader.zig
│   │   │   └── writer.zig
│   │   ├── gltf/
│   │   │   ├── writer.zig
│   │   │   └── scenegraph.zig
│   │   ├── usd/
│   │   │   ├── writer.zig
│   │   │   └── schema.zig
│   │   └── zolygon/
│   │       ├── reader.zig
│   │       ├── writer.zig
│   │       └── schema.md
│   │
│   ├── bindings/
│   │   ├── c/
│   │   │   ├── c_api.zig
│   │   │   ├── header_gen.zig
│   │   │   └── ffi_utils.zig
│   │   ├── python/
│   │   │   ├── py_api.zig
│   │   │   └── wheels/
│   │   │       ├── build_wheel.sh
│   │   │       └── setup.cfg
│   │   ├── rust/
│   │   │   ├── lib.rs.hints
│   │   │   └── examples/
│   │   └── csharp/
│   │       └── pinvoke.md
│   │
│   ├── adapters/
│   │   ├── blender/
│   │   │   ├── addon/
│   │   │   │   ├── __init__.py
│   │   │   │   ├── operators.py
│   │   │   │   ├── panels.py
│   │   │   │   └── zolygon_bridge.py
│   │   │   └── examples/
│   │   ├── plasticity/
│   │   │   ├── sdk_adapter.zig
│   │   │   └── examples/
│   │   └── freecad/
│   │       ├── workbench/
│   │       │   ├── __init__.py
│   │       │   ├── zolygon_tools.py
│   │       │   └── icons/
│   │       └── examples/
│   │
│   └── utils/
│       ├── error.zig
│       ├── diagnostics.zig
│       ├── hashing.zig
│       ├── format.zig
│       ├── path.zig
│       └── time.zig
│
├── examples/
│   ├── nurbs_curve_eval.zig
│   ├── patch_surface_demo.zig
│   ├── boolean_solid_demo.zig
│   ├── stitch_and_heal_demo.zig
│   └── step_to_obj_cli.zig
│
├── tests/
│   ├── unit/
│   │   ├── math_test.zig
│   │   ├── nurbs_test.zig
│   │   ├── brep_test.zig
│   │   ├── boolean_test.zig
│   │   ├── tessellation_test.zig
│   │   └── io_test.zig
│   ├── integration/
│   │   ├── io_roundtrip_test.zig
│   │   ├── sew_heal_conformance.zig
│   │   └── boolean_cad_models.zig
│   └── data/
│       ├── step/
│       ├── iges/
│       ├── obj/
│       └── meshes/
│
├── benches/
│   ├── tess_vs_curvature.zig
│   ├── boolean_cad_models.zig
│   └── sew_perf_suite.zig
│
├── fuzz/
│   ├── fuzz_tess_face.zig
│   ├── fuzz_boolean.zig
│   └── fuzz_sew.zig
│
├── tools/
│   ├── gen_header.zig
│   ├── gen_version.zig
│   ├── zygoncheck.zig
│   └── verify_build.zig
│
├── scripts/
│   ├── dev-link-local.sh
│   ├── release-notes.sh
│   └── format-all.sh
│
└── third_party/
    └── README.md
