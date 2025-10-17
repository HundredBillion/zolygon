const std = @import("std");

// --- Runtime ---
const runtime_context = @import("runtime/context.zig");
const runtime_config = @import("runtime/config.zig");
const runtime_logging = @import("runtime/logging.zig");
const runtime_telemetry = @import("runtime/telemetry.zig");
const runtime_profiling = @import("runtime/profiling.zig");
const runtime_units = @import("runtime/units.zig");

// --- Core ---
const core_math_vec = @import("core/math/vec.zig");
const core_math_mat = @import("core/math/mat.zig");
const core_math_quat = @import("core/math/quat.zig");
const core_math_bbox = @import("core/math/bbox.zig");
const core_math_basis = @import("core/math/basis.zig");
const core_numerics_predicates = @import("core/numerics/predicates.zig");
const core_numerics_roots = @import("core/numerics/roots.zig");
const core_numerics_interval = @import("core/numerics/interval.zig");
const core_numerics_integrate = @import("core/numerics/integrate.zig");
const core_allocator = @import("core/allocator.zig");
const core_tolerance = @import("core/tolerance.zig");
const core_ids = @import("core/ids.zig");

// --- Geom: Analytic ---
const geom_analytic_line = @import("geom/analytic/line.zig");
const geom_analytic_plane = @import("geom/analytic/plane.zig");
const geom_analytic_cone = @import("geom/analytic/cone.zig");
const geom_analytic_cylinder = @import("geom/analytic/cylinder.zig");
const geom_analytic_sphere = @import("geom/analytic/sphere.zig");
const geom_analytic_torus = @import("geom/analytic/torus.zig");

// --- Geom: NURBS ---
const geom_nurbs_curve = @import("geom/nurbs/curve.zig");
const geom_nurbs_surface = @import("geom/nurbs/surface.zig");
const geom_nurbs_knots = @import("geom/nurbs/knots.zig");
const geom_nurbs_trim = @import("geom/nurbs/trim.zig");
const geom_nurbs_eval = @import("geom/nurbs/eval.zig");

// --- Geom: BRep ---
const geom_brep_vertex = @import("geom/brep/vertex.zig");
const geom_brep_edge = @import("geom/brep/edge.zig");
const geom_brep_wire = @import("geom/brep/wire.zig");
const geom_brep_face = @import("geom/brep/face.zig");
const geom_brep_shell = @import("geom/brep/shell.zig");
const geom_brep_solid = @import("geom/brep/solid.zig");
const geom_brep_topology_utils = @import("geom/brep/topology_utils.zig");

// --- Geom: Mesh ---
const geom_mesh_mesh = @import("geom/mesh/mesh.zig");
const geom_mesh_halfedge = @import("geom/mesh/halfedge.zig");
const geom_mesh_subdiv = @import("geom/mesh/subdiv.zig");
const geom_mesh_bvh = @import("geom/mesh/bvh.zig");
const geom_mesh_attr = @import("geom/mesh/attr.zig");

// --- Ops: Construct ---
const ops_construct_extrude = @import("ops/construct/extrude.zig");
const ops_construct_revolve = @import("ops/construct/revolve.zig");
const ops_construct_loft = @import("ops/construct/loft.zig");
const ops_construct_sweep = @import("ops/construct/sweep.zig");
const ops_construct_patch = @import("ops/construct/patch.zig");

// --- Ops: Modify ---
const ops_modify_offset = @import("ops/modify/offset.zig");
const ops_modify_fillet = @import("ops/modify/fillet.zig");
const ops_modify_chamfer = @import("ops/modify/chamfer.zig");
const ops_modify_draft = @import("ops/modify/draft.zig");

// --- Ops: Intersect ---
const ops_intersect_curve_curve = @import("ops/intersect/curve_curve.zig");
const ops_intersect_curve_surface = @import("ops/intersect/curve_surface.zig");
const ops_intersect_surface_surface = @import("ops/intersect/surface_surface.zig");
const ops_intersect_mesh_intersect = @import("ops/intersect/mesh_intersect.zig");

// --- Ops: Boolean ---
const ops_boolean_classify = @import("ops/boolean/classify.zig");
const ops_boolean_split_faces = @import("ops/boolean/split_faces.zig");
const ops_boolean_boolean_solid = @import("ops/boolean/boolean_solid.zig");

// --- Ops: Sew/Heal ---
const ops_sew_heal_sew = @import("ops/sew_heal/sew.zig");
const ops_sew_heal_heal = @import("ops/sew_heal/heal.zig");

// --- Ops: Tess ---
const ops_tess_tess_face = @import("ops/tess/tess_face.zig");
const ops_tess_tess_solid = @import("ops/tess/tess_solid.zig");
const ops_tess_curvature_eval = @import("ops/tess/curvature_eval.zig");
const ops_tess_uv_pack = @import("ops/tess/uv_pack.zig");

// --- Ops: Project ---
const ops_project_project_curve = @import("ops/project/project_curve.zig");
const ops_project_reparam = @import("ops/project/reparam.zig");

// --- Accel ---
const accel_bvh = @import("accel/bvh.zig");
const accel_kdtree = @import("accel/kdtree.zig");
const accel_grid = @import("accel/grid.zig");
const accel_spatial_hash = @import("accel/spatial_hash.zig");

// --- IO: STEP ---
const io_step_reader = @import("io/step/reader.zig");
const io_step_writer = @import("io/step/writer.zig");

// --- IO: IGES ---
const io_iges_reader = @import("io/iges/reader.zig");
const io_iges_writer = @import("io/iges/writer.zig");

// --- IO: STL ---
const io_stl_reader = @import("io/stl/reader.zig");
const io_stl_writer = @import("io/stl/writer.zig");

// --- IO: OBJ ---
const io_obj_reader = @import("io/obj/reader.zig");
const io_obj_writer = @import("io/obj/writer.zig");

// --- IO: glTF ---
const io_gltf_writer = @import("io/gltf/writer.zig");
const io_gltf_scenegraph = @import("io/gltf/scenegraph.zig");

// --- IO: USD ---
const io_usd_writer = @import("io/usd/writer.zig");
const io_usd_schema = @import("io/usd/schema.zig");

// --- IO: Zolygon ---
const io_zolygon_reader = @import("io/zolygon/reader.zig");
const io_zolygon_writer = @import("io/zolygon/writer.zig");

// --- Bindings: C ---
const bindings_c_api = @import("bindings/c/c_api.zig");
const bindings_c_header_gen = @import("bindings/c/header_gen.zig");
const bindings_c_ffi_utils = @import("bindings/c/ffi_utils.zig");

// --- Bindings: Python ---
const bindings_python_py_api = @import("bindings/python/py_api.zig");

// --- Bindings: Rust ---
const bindings_rust_lib_rs_hints = @import("bindings/rust/lib.rs.hints");

// --- Adapters: Blender ---
const adapters_blender_addon_zolygon_bridge = @import("adapters/blender/addon/zolygon_bridge.py");

// --- Adapters: Plasticity ---
const adapters_plasticity_sdk_adapter = @import("adapters/plasticity/sdk_adapter.zig");

// --- Adapters: FreeCAD ---
const adapters_freecad_workbench_zolygon_tools = @import("adapters/freecad/workbench/zolygon_tools.py");

// --- Utils ---
const utils_error = @import("utils/error.zig");
const utils_diagnostics = @import("utils/diagnostics.zig");
const utils_hashing = @import("utils/hashing.zig");
const utils_format = @import("utils/format.zig");
const utils_path = @import("utils/path.zig");
const utils_time = @import("utils/time.zig");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    // --- Runtime ---
    try runtime_logging.init();
    const ctx = runtime_context.Context.init();
    _ = ctx;
    try runtime_telemetry.start();
    try runtime_profiling.start();
    const units = runtime_units.UnitSystem.metric;
    _ = units;

    // --- Core ---
    const v = core_math_vec.Vec3{ .x = 1, .y = 2, .z = 3 };
    const m = core_math_mat.Mat4x4.identity();
    const q = core_math_quat.Quat{ .w = 1, .x = 0, .y = 0, .z = 0 };
    const bbox = core_math_bbox.BBox3.init(v, v);
    const basis = core_math_basis.Basis3.identity();
    _ = core_numerics_predicates.isZero(0.0);
    _ = core_numerics_roots.solveQuadratic(1.0, 0.0, -1.0);
    _ = core_numerics_interval.Interval.init(0.0, 1.0);
    _ = core_numerics_integrate.trapezoidal(0.0, 1.0, 10, (x: f64) f64 { return x; });
    _ = core_allocator.default_allocator;
    _ = core_tolerance.default_tolerance;
    _ = core_ids.new_id();

    // --- Geom: Analytic ---
    const line = geom_analytic_line.Line.init(v, v);
    const plane = geom_analytic_plane.Plane.init(v, v);
    const cone = geom_analytic_cone.Cone.init(v, 1.0, 2.0);
    const cylinder = geom_analytic_cylinder.Cylinder.init(v, 1.0, 2.0);
    const sphere = geom_analytic_sphere.Sphere.init(v, 1.0);
    const torus = geom_analytic_torus.Torus.init(v, 1.0, 0.5);
    _ = line; _ = plane; _ = cone; _ = cylinder; _ = sphere; _ = torus;

    // --- Geom: NURBS ---
    _ = geom_nurbs_curve.createExample();
    _ = geom_nurbs_surface.createExample();
    _ = geom_nurbs_knots.createUniform(4, 8);
    _ = geom_nurbs_trim.trimCurve();
    _ = geom_nurbs_eval.evalCurve();

    // --- Geom: BRep ---
    _ = geom_brep_vertex.create();
    _ = geom_brep_edge.create();
    _ = geom_brep_wire.create();
    _ = geom_brep_face.create();
    _ = geom_brep_shell.create();
    _ = geom_brep_solid.create();
    _ = geom_brep_topology_utils.validate();

    // --- Geom: Mesh ---
    _ = geom_mesh_mesh.create();
    _ = geom_mesh_halfedge.create();
    _ = geom_mesh_subdiv.subdivide();
    _ = geom_mesh_bvh.build();
    _ = geom_mesh_attr.setAttribute();

    // --- Ops: Construct ---
    _ = ops_construct_extrude.extrude();
    _ = ops_construct_revolve.revolve();
    _ = ops_construct_loft.loft();
    _ = ops_construct_sweep.sweep();
    _ = ops_construct_patch.patch();

    // --- Ops: Modify ---
    _ = ops_modify_offset.offset();
    _ = ops_modify_fillet.fillet();
    _ = ops_modify_chamfer.chamfer();
    _ = ops_modify_draft.draft();

    // --- Ops: Intersect ---
    _ = ops_intersect_curve_curve.intersect();
    _ = ops_intersect_curve_surface.intersect();
    _ = ops_intersect_surface_surface.intersect();
    _ = ops_intersect_mesh_intersect.intersect();

    // --- Ops: Boolean ---
    _ = ops_boolean_classify.classify();
    _ = ops_boolean_split_faces.split();
    _ = ops_boolean_boolean_solid.boolean();

    // --- Ops: Sew/Heal ---
    _ = ops_sew_heal_sew.sew();
    _ = ops_sew_heal_heal.heal();

    // --- Ops: Tess ---
    _ = ops_tess_tess_face.tessellate();
    _ = ops_tess_tess_solid.tessellate();
    _ = ops_tess_curvature_eval.evaluate();
    _ = ops_tess_uv_pack.pack();

    // --- Ops: Project ---
    _ = ops_project_project_curve.project();
    _ = ops_project_reparam.reparam();

    // --- Accel ---
    _ = accel_bvh.build();
    _ = accel_kdtree.build();
    _ = accel_grid.build();
    _ = accel_spatial_hash.hash();

    // --- IO ---
    _ = io_step_reader.read("example.step");
    _ = io_step_writer.write("example.step");
    _ = io_iges_reader.read("example.iges");
    _ = io_iges_writer.write("example.iges");
    _ = io_stl_reader.read("example.stl");
    _ = io_stl_writer.write("example.stl");
    _ = io_obj_reader.read("example.obj");
    _ = io_obj_writer.write("example.obj");
    _ = io_gltf_writer.write("example.gltf");
    _ = io_gltf_scenegraph.build();
    _ = io_usd_writer.write("example.usd");
    _ = io_usd_schema.define();
    _ = io_zolygon_reader.read("example.zol");
    _ = io_zolygon_writer.write("example.zol");

    // --- Bindings ---
    _ = bindings_c_api.init();
    _ = bindings_c_header_gen.generate();
    _ = bindings_c_ffi_utils.util();
    _ = bindings_python_py_api.init();
    _ = bindings_rust_lib_rs_hints.hint();

    // --- Adapters ---
    _ = adapters_blender_addon_zolygon_bridge.bridge();
    _ = adapters_plasticity_sdk_adapter.init();
    _ = adapters_freecad_workbench_zolygon_tools.tool();

    // --- Utils ---
    _ = utils_error.handle();
    _ = utils_diagnostics.diagnose();
    _ = utils_hashing.hash();
    _ = utils_format.format();
    _ = utils_path.join();
    _ = utils_time.now();

    try stdout.print("Zolygon kernel initialized and all modules invoked!\n", .{});
}