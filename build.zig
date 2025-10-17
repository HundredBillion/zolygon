const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Main executable
    const exe = b.addExecutable("zolygon", "src/main.zig");
    exe.setTarget(target);
    exe.setOptimize(optimize);
    exe.install();

    // Tools
    const gen_header = b.addExecutable("gen_header", "tools/gen_header.zig");
    gen_header.setTarget(target);
    gen_header.setOptimize(optimize);
    gen_header.install();

    const gen_version = b.addExecutable("gen_version", "tools/gen_version.zig");
    gen_version.setTarget(target);
    gen_version.setOptimize(optimize);
    gen_version.install();

    const zygoncheck = b.addExecutable("zygoncheck", "tools/zygoncheck.zig");
    zygoncheck.setTarget(target);
    zygoncheck.setOptimize(optimize);
    zygoncheck.install();

    const verify_build = b.addExecutable("verify_build", "tools/verify_build.zig");
    verify_build.setTarget(target);
    verify_build.setOptimize(optimize);
    verify_build.install();

    // Examples
    const nurbs_curve_eval = b.addExecutable("nurbs_curve_eval", "examples/nurbs_curve_eval.zig");
    nurbs_curve_eval.setTarget(target);
    nurbs_curve_eval.setOptimize(optimize);
    nurbs_curve_eval.install();

    const patch_surface_demo = b.addExecutable("patch_surface_demo", "examples/patch_surface_demo.zig");
    patch_surface_demo.setTarget(target);
    patch_surface_demo.setOptimize(optimize);
    patch_surface_demo.install();

    const boolean_solid_demo = b.addExecutable("boolean_solid_demo", "examples/boolean_solid_demo.zig");
    boolean_solid_demo.setTarget(target);
    boolean_solid_demo.setOptimize(optimize);
    boolean_solid_demo.install();

    const stitch_and_heal_demo = b.addExecutable("stitch_and_heal_demo", "examples/stitch_and_heal_demo.zig");
    stitch_and_heal_demo.setTarget(target);
    stitch_and_heal_demo.setOptimize(optimize);
    stitch_and_heal_demo.install();

    const step_to_obj_cli = b.addExecutable("step_to_obj_cli", "examples/step_to_obj_cli.zig");
    step_to_obj_cli.setTarget(target);
    step_to_obj_cli.setOptimize(optimize);
    step_to_obj_cli.install();

    // Unit tests
    const math_test = b.addTest("tests/unit/math_test.zig");
    math_test.setTarget(target);
    math_test.setOptimize(optimize);

    const nurbs_test = b.addTest("tests/unit/nurbs_test.zig");
    nurbs_test.setTarget(target);
    nurbs_test.setOptimize(optimize);

    const brep_test = b.addTest("tests/unit/brep_test.zig");
    brep_test.setTarget(target);
    brep_test.setOptimize(optimize);

    const boolean_test = b.addTest("tests/unit/boolean_test.zig");
    boolean_test.setTarget(target);
    boolean_test.setOptimize(optimize);

    const tessellation_test = b.addTest("tests/unit/tessellation_test.zig");
    tessellation_test.setTarget(target);
    tessellation_test.setOptimize(optimize);

    const io_test = b.addTest("tests/unit/io_test.zig");
    io_test.setTarget(target);
    io_test.setOptimize(optimize);

    // Integration tests
    const io_roundtrip_test = b.addTest("tests/integration/io_roundtrip_test.zig");
    io_roundtrip_test.setTarget(target);
    io_roundtrip_test.setOptimize(optimize);

    const sew_heal_conformance = b.addTest("tests/integration/sew_heal_conformance.zig");
    sew_heal_conformance.setTarget(target);
    sew_heal_conformance.setOptimize(optimize);

    const boolean_cad_models = b.addTest("tests/integration/boolean_cad_models.zig");
    boolean_cad_models.setTarget(target);
    boolean_cad_models.setOptimize(optimize);

    // Benches
    const tess_vs_curvature = b.addExecutable("tess_vs_curvature", "benches/tess_vs_curvature.zig");
    tess_vs_curvature.setTarget(target);
    tess_vs_curvature.setOptimize(optimize);
    tess_vs_curvature.install();

    const boolean_cad_models_bench = b.addExecutable("boolean_cad_models_bench", "benches/boolean_cad_models.zig");
    boolean_cad_models_bench.setTarget(target);
    boolean_cad_models_bench.setOptimize(optimize);
    boolean_cad_models_bench.install();

    const sew_perf_suite = b.addExecutable("sew_perf_suite", "benches/sew_perf_suite.zig");
    sew_perf_suite.setTarget(target);
    sew_perf_suite.setOptimize(optimize);
    sew_perf_suite.install();

    // Fuzzers
    const fuzz_tess_face = b.addExecutable("fuzz_tess_face", "fuzz/fuzz_tess_face.zig");
    fuzz_tess_face.setTarget(target);
    fuzz_tess_face.setOptimize(optimize);
    fuzz_tess_face.install();

    const fuzz_boolean = b.addExecutable("fuzz_boolean", "fuzz/fuzz_boolean.zig");
    fuzz_boolean.setTarget(target);
    fuzz_boolean.setOptimize(optimize);
    fuzz_boolean.install();

    const fuzz_sew = b.addExecutable("fuzz_sew", "fuzz/fuzz_sew.zig");
    fuzz_sew.setTarget(target);
    fuzz_sew.setOptimize(optimize);
    fuzz_sew.install();
}
