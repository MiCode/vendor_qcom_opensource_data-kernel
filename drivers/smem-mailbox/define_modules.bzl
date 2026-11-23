load("//build/kernel/kleaf:kernel.bzl", "ddk_module")
load("//build/bazel_common_rules/dist:dist.bzl", "copy_to_dist_dir")

def define_modules(target, variant):
    kernel_build_variant = "{}_{}".format(target, variant)

    deps = select({
        "//build/kernel/kleaf:socrepo_true": ["//soc-repo:all_headers", "//soc-repo:{}/drivers/soc/qcom/smem".format(kernel_build_variant)],
        "//build/kernel/kleaf:socrepo_false": ["//msm-kernel:all_headers"],
    })
    kernel_build = select({
        "//build/kernel/kleaf:socrepo_true": "//soc-repo:{}_base_kernel".format(kernel_build_variant),
        "//build/kernel/kleaf:socrepo_false": "//msm-kernel:{}".format(kernel_build_variant),
    })

    ddk_module(
        name = "{}_smem_mailbox".format(kernel_build_variant),
        kernel_build = kernel_build,
        deps = deps,
        srcs = [
            "smem-mailbox.c",
        ],
        hdrs = [
            "include/smem-mailbox.h",
        ],
        includes = [
            "include",
        ],
        out = "smem-mailbox.ko",
        visibility = ["//visibility:public"],
    )

    copy_to_dist_dir(
        name = "{}_smem_mailbox_dist".format(kernel_build_variant),
        data = [":{}_smem_mailbox".format(kernel_build_variant)],
        dist_dir = "out/target/product/{}/dlkm/lib/modules/".format(kernel_build_variant),
        flat = True,
        wipe_dist_dir = False,
        allow_duplicate_filenames = False,
        mode_overrides = {"**/*": "644"},
    )
