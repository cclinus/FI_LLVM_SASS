; ModuleID = 'lud_kernels.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v32:32:32-v64:64:64-v128:128:128-n16:32:64"
target triple = "nvptx-nvidia-cl.1.0"

@_ZZ12lud_diagonalPfiiE6shadow = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4
@_ZZ13lud_perimeterPfiiE3dia = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4
@_ZZ13lud_perimeterPfiiE8peri_row = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4
@_ZZ13lud_perimeterPfiiE8peri_col = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4
@_ZZ12lud_internalPfiiE8peri_row = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4
@_ZZ12lud_internalPfiiE8peri_col = internal addrspace(3) global [16 x [16 x float]] zeroinitializer, align 4
@llvm.used = appending global [9 x i8*] [i8* bitcast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow to i8*), i8* bitcast (void (float*, i32, i32)* @_Z12lud_diagonalPfii to i8*), i8* bitcast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia to i8*), i8* bitcast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row to i8*), i8* bitcast ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col to i8*), i8* bitcast (void (float*, i32, i32)* @_Z13lud_perimeterPfii to i8*), i8* bitcast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row to i8*), i8* bitcast ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col to i8*), i8* bitcast (void (float*, i32, i32)* @_Z12lud_internalPfii to i8*)], section "llvm.metadata"
@"$str" = private addrspace(1) constant [11 x i8] c"__CUDA_FTZ\00"

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @_Z12lud_diagonalPfii(float* %m, i32 %matrix_dim, i32 %offset) alwaysinline {
  call void @llvm.dbg.value(metadata !{float* %m}, i64 0, metadata !71), !dbg !72
  call void @llvm.dbg.value(metadata !{i32 %matrix_dim}, i64 0, metadata !73), !dbg !74
  call void @llvm.dbg.value(metadata !{i32 %offset}, i64 0, metadata !75), !dbg !74
  %1 = mul nsw i32 %offset, %matrix_dim, !dbg !76
  %2 = add nsw i32 %1, %offset, !dbg !76
  call void @llvm.dbg.value(metadata !{i32 %2}, i64 0, metadata !77), !dbg !76
  %move2 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !78
  call void @llvm.dbg.value(metadata !{i32 %move2}, i64 0, metadata !80), !dbg !78
  br label %3, !dbg !81

; <label>:3                                       ; preds = %17, %0
  %__cuda_local_var_37276_6_non_const_i.0 = phi i32 [ %move2, %0 ], [ %18, %17 ], !dbg !81
  %__cuda_local_var_37279_6_non_const_array_offset.0 = phi i32 [ %2, %0 ], [ %16, %17 ], !dbg !81
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37276_6_non_const_i.0}, i64 0, metadata !80)
  %4 = icmp slt i32 %__cuda_local_var_37276_6_non_const_i.0, 16, !dbg !81
  br i1 %4, label %5, label %19, !dbg !81

; <label>:5                                       ; preds = %3
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !83
  %7 = add i32 %__cuda_local_var_37279_6_non_const_array_offset.0, %6, !dbg !83
  %8 = zext i32 %7 to i64, !dbg !83
  %9 = getelementptr inbounds float* %m, i64 %8, !dbg !83
  %10 = load float* %9, align 4, !dbg !83
  %11 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i32 %__cuda_local_var_37276_6_non_const_i.0, !dbg !83
  %12 = getelementptr inbounds [16 x float] addrspace(3)* %11, i32 0, i32 0, !dbg !83
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !83
  %14 = zext i32 %13 to i64, !dbg !83
  %15 = getelementptr inbounds float addrspace(3)* %12, i64 %14, !dbg !83
  store float %10, float addrspace(3)* %15, align 4, !dbg !83
  %16 = add nsw i32 %__cuda_local_var_37279_6_non_const_array_offset.0, %matrix_dim, !dbg !85
  call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !77), !dbg !85
  br label %17, !dbg !86

; <label>:17                                      ; preds = %5
  %18 = add nsw i32 %__cuda_local_var_37276_6_non_const_i.0, 1, !dbg !86
  call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !80), !dbg !86
  br label %3, !dbg !86

; <label>:19                                      ; preds = %3
  call void @llvm.cuda.syncthreads(), !dbg !87
  %move1 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !88
  call void @llvm.dbg.value(metadata !{i32 %move1}, i64 0, metadata !80), !dbg !88
  br label %20, !dbg !90

; <label>:20                                      ; preds = %103, %19
  %__cuda_local_var_37276_6_non_const_i.1 = phi i32 [ %move1, %19 ], [ %104, %103 ], !dbg !90
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37276_6_non_const_i.1}, i64 0, metadata !80)
  %21 = icmp slt i32 %__cuda_local_var_37276_6_non_const_i.1, 15, !dbg !90
  br i1 %21, label %22, label %105, !dbg !90

; <label>:22                                      ; preds = %20
  %23 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !92
  %24 = icmp ugt i32 %23, %__cuda_local_var_37276_6_non_const_i.1, !dbg !92
  br i1 %24, label %25, label %71, !dbg !92

; <label>:25                                      ; preds = %22
  %move4 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !95
  call void @llvm.dbg.value(metadata !{i32 %move4}, i64 0, metadata !98), !dbg !95
  br label %26, !dbg !99

; <label>:26                                      ; preds = %47, %25
  %__cuda_local_var_37276_8_non_const_j.0 = phi i32 [ %move4, %25 ], [ %48, %47 ], !dbg !99
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37276_8_non_const_j.0}, i64 0, metadata !98)
  %27 = icmp slt i32 %__cuda_local_var_37276_8_non_const_j.0, %__cuda_local_var_37276_6_non_const_i.1, !dbg !99
  br i1 %27, label %28, label %49, !dbg !99

; <label>:28                                      ; preds = %26
  %29 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !101
  %30 = zext i32 %29 to i64, !dbg !101
  %31 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i64 %30, !dbg !101
  %32 = getelementptr inbounds [16 x float] addrspace(3)* %31, i32 0, i32 0, !dbg !101
  %33 = getelementptr inbounds float addrspace(3)* %32, i32 %__cuda_local_var_37276_8_non_const_j.0, !dbg !101
  %34 = load float addrspace(3)* %33, align 4, !dbg !101
  %35 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i32 %__cuda_local_var_37276_8_non_const_j.0, !dbg !101
  %36 = getelementptr inbounds [16 x float] addrspace(3)* %35, i32 0, i32 0, !dbg !101
  %37 = getelementptr inbounds float addrspace(3)* %36, i32 %__cuda_local_var_37276_6_non_const_i.1, !dbg !101
  %38 = load float addrspace(3)* %37, align 4, !dbg !101
  %39 = fmul float %34, %38, !dbg !101
  %40 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !101
  %41 = zext i32 %40 to i64, !dbg !101
  %42 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i64 %41, !dbg !101
  %43 = getelementptr inbounds [16 x float] addrspace(3)* %42, i32 0, i32 0, !dbg !101
  %44 = getelementptr inbounds float addrspace(3)* %43, i32 %__cuda_local_var_37276_6_non_const_i.1, !dbg !101
  %45 = load float addrspace(3)* %44, align 4, !dbg !101
  %46 = fsub float %45, %39, !dbg !101
  store float %46, float addrspace(3)* %44, align 4, !dbg !101
  br label %47, !dbg !103

; <label>:47                                      ; preds = %28
  %48 = add nsw i32 %__cuda_local_var_37276_8_non_const_j.0, 1, !dbg !103
  call void @llvm.dbg.value(metadata !{i32 %48}, i64 0, metadata !98), !dbg !103
  br label %26, !dbg !103

; <label>:49                                      ; preds = %26
  %50 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !104
  %51 = zext i32 %50 to i64, !dbg !104
  %52 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i64 %51, !dbg !104
  %53 = getelementptr inbounds [16 x float] addrspace(3)* %52, i32 0, i32 0, !dbg !104
  %54 = getelementptr inbounds float addrspace(3)* %53, i32 %__cuda_local_var_37276_6_non_const_i.1, !dbg !104
  %55 = load float addrspace(3)* %54, align 4, !dbg !104
  %56 = fpext float %55 to double, !dbg !104
  %57 = fptrunc double %56 to float, !dbg !104
  %58 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i32 %__cuda_local_var_37276_6_non_const_i.1, !dbg !104
  %59 = getelementptr inbounds [16 x float] addrspace(3)* %58, i32 0, i32 0, !dbg !104
  %60 = getelementptr inbounds float addrspace(3)* %59, i32 %__cuda_local_var_37276_6_non_const_i.1, !dbg !104
  %61 = load float addrspace(3)* %60, align 4, !dbg !104
  %62 = fpext float %61 to double, !dbg !104
  %63 = fptrunc double %62 to float, !dbg !104
  call void @llvm.dbg.value(metadata !{float %57}, i64 0, metadata !105), !dbg !107
  call void @llvm.dbg.value(metadata !{float %63}, i64 0, metadata !108), !dbg !109
  %64 = call i8* @llvm.nvvm.ptr.global.to.gen.p0i8.p1i8(i8 addrspace(1)* getelementptr inbounds ([11 x i8] addrspace(1)* @"$str", i32 0, i32 0)), !dbg !110
  %65 = call float @llvm.nvvm.div.approx.ftz.f(float %57, float %63), !dbg !110
  br label %fdividef.exit, !dbg !110

fdividef.exit:                                    ; preds = %49
  %retval.0.i.i = phi float [ %65, %49 ], !dbg !110
  %66 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !106
  %67 = zext i32 %66 to i64, !dbg !106
  %68 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i64 %67, !dbg !106
  %69 = getelementptr inbounds [16 x float] addrspace(3)* %68, i32 0, i32 0, !dbg !106
  %70 = getelementptr inbounds float addrspace(3)* %69, i32 %__cuda_local_var_37276_6_non_const_i.1, !dbg !106
  store float %retval.0.i.i, float addrspace(3)* %70, align 4, !dbg !106
  br label %71, !dbg !106

; <label>:71                                      ; preds = %fdividef.exit, %22
  call void @llvm.cuda.syncthreads(), !dbg !112
  %72 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !113
  %73 = icmp ugt i32 %72, %__cuda_local_var_37276_6_non_const_i.1, !dbg !113
  br i1 %73, label %74, label %102, !dbg !113

; <label>:74                                      ; preds = %71
  %move3 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !115
  call void @llvm.dbg.value(metadata !{i32 %move3}, i64 0, metadata !98), !dbg !115
  br label %75, !dbg !118

; <label>:75                                      ; preds = %99, %74
  %__cuda_local_var_37276_8_non_const_j.1 = phi i32 [ %move3, %74 ], [ %100, %99 ], !dbg !118
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37276_8_non_const_j.1}, i64 0, metadata !98)
  %76 = add nsw i32 %__cuda_local_var_37276_6_non_const_i.1, 1, !dbg !118
  %77 = icmp slt i32 %__cuda_local_var_37276_8_non_const_j.1, %76, !dbg !118
  br i1 %77, label %78, label %101, !dbg !118

; <label>:78                                      ; preds = %75
  %79 = add nsw i32 %__cuda_local_var_37276_6_non_const_i.1, 1, !dbg !120
  %80 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i32 %79, !dbg !120
  %81 = getelementptr inbounds [16 x float] addrspace(3)* %80, i32 0, i32 0, !dbg !120
  %82 = getelementptr inbounds float addrspace(3)* %81, i32 %__cuda_local_var_37276_8_non_const_j.1, !dbg !120
  %83 = load float addrspace(3)* %82, align 4, !dbg !120
  %84 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i32 %__cuda_local_var_37276_8_non_const_j.1, !dbg !120
  %85 = getelementptr inbounds [16 x float] addrspace(3)* %84, i32 0, i32 0, !dbg !120
  %86 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !120
  %87 = zext i32 %86 to i64, !dbg !120
  %88 = getelementptr inbounds float addrspace(3)* %85, i64 %87, !dbg !120
  %89 = load float addrspace(3)* %88, align 4, !dbg !120
  %90 = fmul float %83, %89, !dbg !120
  %91 = add nsw i32 %__cuda_local_var_37276_6_non_const_i.1, 1, !dbg !120
  %92 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i32 %91, !dbg !120
  %93 = getelementptr inbounds [16 x float] addrspace(3)* %92, i32 0, i32 0, !dbg !120
  %94 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !120
  %95 = zext i32 %94 to i64, !dbg !120
  %96 = getelementptr inbounds float addrspace(3)* %93, i64 %95, !dbg !120
  %97 = load float addrspace(3)* %96, align 4, !dbg !120
  %98 = fsub float %97, %90, !dbg !120
  store float %98, float addrspace(3)* %96, align 4, !dbg !120
  br label %99, !dbg !122

; <label>:99                                      ; preds = %78
  %100 = add nsw i32 %__cuda_local_var_37276_8_non_const_j.1, 1, !dbg !122
  call void @llvm.dbg.value(metadata !{i32 %100}, i64 0, metadata !98), !dbg !122
  br label %75, !dbg !122

; <label>:101                                     ; preds = %75
  br label %102, !dbg !122

; <label>:102                                     ; preds = %101, %71
  call void @llvm.cuda.syncthreads(), !dbg !123
  br label %103, !dbg !124

; <label>:103                                     ; preds = %102
  %104 = add nsw i32 %__cuda_local_var_37276_6_non_const_i.1, 1, !dbg !124
  call void @llvm.dbg.value(metadata !{i32 %104}, i64 0, metadata !80), !dbg !124
  br label %20, !dbg !124

; <label>:105                                     ; preds = %20
  %106 = add nsw i32 %offset, 1, !dbg !125
  %107 = mul nsw i32 %106, %matrix_dim, !dbg !125
  %108 = add nsw i32 %107, %offset, !dbg !125
  call void @llvm.dbg.value(metadata !{i32 %108}, i64 0, metadata !77), !dbg !125
  %move = call i32 @llvm.nvvm.move.i32(i32 1), !dbg !126
  call void @llvm.dbg.value(metadata !{i32 %move}, i64 0, metadata !80), !dbg !126
  br label %109, !dbg !128

; <label>:109                                     ; preds = %123, %105
  %__cuda_local_var_37276_6_non_const_i.2 = phi i32 [ %move, %105 ], [ %124, %123 ], !dbg !128
  %__cuda_local_var_37279_6_non_const_array_offset.1 = phi i32 [ %108, %105 ], [ %122, %123 ], !dbg !128
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37276_6_non_const_i.2}, i64 0, metadata !80)
  %110 = icmp slt i32 %__cuda_local_var_37276_6_non_const_i.2, 16, !dbg !128
  br i1 %110, label %111, label %125, !dbg !128

; <label>:111                                     ; preds = %109
  %112 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 0, i32 0), i32 %__cuda_local_var_37276_6_non_const_i.2, !dbg !130
  %113 = getelementptr inbounds [16 x float] addrspace(3)* %112, i32 0, i32 0, !dbg !130
  %114 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !130
  %115 = zext i32 %114 to i64, !dbg !130
  %116 = getelementptr inbounds float addrspace(3)* %113, i64 %115, !dbg !130
  %117 = load float addrspace(3)* %116, align 4, !dbg !130
  %118 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !130
  %119 = add i32 %__cuda_local_var_37279_6_non_const_array_offset.1, %118, !dbg !130
  %120 = zext i32 %119 to i64, !dbg !130
  %121 = getelementptr inbounds float* %m, i64 %120, !dbg !130
  store float %117, float* %121, align 4, !dbg !130
  %122 = add nsw i32 %__cuda_local_var_37279_6_non_const_array_offset.1, %matrix_dim, !dbg !132
  call void @llvm.dbg.value(metadata !{i32 %122}, i64 0, metadata !77), !dbg !132
  br label %123, !dbg !133

; <label>:123                                     ; preds = %111
  %124 = add nsw i32 %__cuda_local_var_37276_6_non_const_i.2, 1, !dbg !133
  call void @llvm.dbg.value(metadata !{i32 %124}, i64 0, metadata !80), !dbg !133
  br label %109, !dbg !133

; <label>:125                                     ; preds = %109
  ret void, !dbg !134
}

declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() nounwind readnone

declare void @llvm.cuda.syncthreads() nounwind

define void @_Z13lud_perimeterPfii(float* %m, i32 %matrix_dim, i32 %offset) alwaysinline {
  call void @llvm.dbg.value(metadata !{float* %m}, i64 0, metadata !135), !dbg !136
  call void @llvm.dbg.value(metadata !{i32 %matrix_dim}, i64 0, metadata !137), !dbg !138
  call void @llvm.dbg.value(metadata !{i32 %offset}, i64 0, metadata !139), !dbg !138
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !140
  %2 = icmp ult i32 %1, 16, !dbg !140
  br i1 %2, label %3, label %40, !dbg !140

; <label>:3                                       ; preds = %0
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !142
  call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !144), !dbg !142
  %5 = mul nsw i32 %offset, %matrix_dim, !dbg !145
  %6 = add nsw i32 %5, %offset, !dbg !145
  call void @llvm.dbg.value(metadata !{i32 %6}, i64 0, metadata !146), !dbg !145
  %move7 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !147
  call void @llvm.dbg.value(metadata !{i32 %move7}, i64 0, metadata !149), !dbg !147
  br label %7, !dbg !150

; <label>:7                                       ; preds = %17, %3
  %__cuda_local_var_37322_6_non_const_i.0 = phi i32 [ %move7, %3 ], [ %18, %17 ], !dbg !150
  %__cuda_local_var_37322_11_non_const_array_offset.0 = phi i32 [ %6, %3 ], [ %16, %17 ], !dbg !150
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.0}, i64 0, metadata !149)
  %8 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.0, 8, !dbg !150
  br i1 %8, label %9, label %19, !dbg !150

; <label>:9                                       ; preds = %7
  %10 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.0, %4, !dbg !152
  %11 = getelementptr inbounds float* %m, i32 %10, !dbg !152
  %12 = load float* %11, align 4, !dbg !152
  %13 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.0, !dbg !152
  %14 = getelementptr inbounds [16 x float] addrspace(3)* %13, i32 0, i32 0, !dbg !152
  %15 = getelementptr inbounds float addrspace(3)* %14, i32 %4, !dbg !152
  store float %12, float addrspace(3)* %15, align 4, !dbg !152
  %16 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.0, %matrix_dim, !dbg !154
  call void @llvm.dbg.value(metadata !{i32 %16}, i64 0, metadata !146), !dbg !154
  br label %17, !dbg !155

; <label>:17                                      ; preds = %9
  %18 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.0, 1, !dbg !155
  call void @llvm.dbg.value(metadata !{i32 %18}, i64 0, metadata !149), !dbg !155
  br label %7, !dbg !155

; <label>:19                                      ; preds = %7
  %20 = mul nsw i32 %offset, %matrix_dim, !dbg !156
  %21 = add nsw i32 %20, %offset, !dbg !156
  call void @llvm.dbg.value(metadata !{i32 %21}, i64 0, metadata !146), !dbg !156
  %move6 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !157
  call void @llvm.dbg.value(metadata !{i32 %move6}, i64 0, metadata !149), !dbg !157
  br label %22, !dbg !159

; <label>:22                                      ; preds = %37, %19
  %__cuda_local_var_37322_6_non_const_i.1 = phi i32 [ %move6, %19 ], [ %38, %37 ], !dbg !159
  %__cuda_local_var_37322_11_non_const_array_offset.1 = phi i32 [ %21, %19 ], [ %36, %37 ], !dbg !159
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.1}, i64 0, metadata !149)
  %23 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.1, 16, !dbg !159
  br i1 %23, label %24, label %39, !dbg !159

; <label>:24                                      ; preds = %22
  %25 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !161
  %26 = add i32 %25, 1, !dbg !161
  %27 = mul i32 %26, 16, !dbg !161
  %28 = add i32 %__cuda_local_var_37322_11_non_const_array_offset.1, %27, !dbg !161
  %29 = add i32 %28, %4, !dbg !161
  %30 = zext i32 %29 to i64, !dbg !161
  %31 = getelementptr inbounds float* %m, i64 %30, !dbg !161
  %32 = load float* %31, align 4, !dbg !161
  %33 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.1, !dbg !161
  %34 = getelementptr inbounds [16 x float] addrspace(3)* %33, i32 0, i32 0, !dbg !161
  %35 = getelementptr inbounds float addrspace(3)* %34, i32 %4, !dbg !161
  store float %32, float addrspace(3)* %35, align 4, !dbg !161
  %36 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.1, %matrix_dim, !dbg !163
  call void @llvm.dbg.value(metadata !{i32 %36}, i64 0, metadata !146), !dbg !163
  br label %37, !dbg !164

; <label>:37                                      ; preds = %24
  %38 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.1, 1, !dbg !164
  call void @llvm.dbg.value(metadata !{i32 %38}, i64 0, metadata !149), !dbg !164
  br label %22, !dbg !164

; <label>:39                                      ; preds = %22
  br label %78, !dbg !164

; <label>:40                                      ; preds = %0
  %41 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !165
  %42 = sub i32 %41, 16, !dbg !165
  call void @llvm.dbg.value(metadata !{i32 %42}, i64 0, metadata !144), !dbg !165
  %43 = add nsw i32 %offset, 8, !dbg !167
  %44 = mul nsw i32 %43, %matrix_dim, !dbg !167
  %45 = add nsw i32 %44, %offset, !dbg !167
  call void @llvm.dbg.value(metadata !{i32 %45}, i64 0, metadata !146), !dbg !167
  %move5 = call i32 @llvm.nvvm.move.i32(i32 8), !dbg !168
  call void @llvm.dbg.value(metadata !{i32 %move5}, i64 0, metadata !149), !dbg !168
  br label %46, !dbg !170

; <label>:46                                      ; preds = %56, %40
  %__cuda_local_var_37322_6_non_const_i.2 = phi i32 [ %move5, %40 ], [ %57, %56 ], !dbg !170
  %__cuda_local_var_37322_11_non_const_array_offset.2 = phi i32 [ %45, %40 ], [ %55, %56 ], !dbg !170
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.2}, i64 0, metadata !149)
  %47 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.2, 16, !dbg !170
  br i1 %47, label %48, label %58, !dbg !170

; <label>:48                                      ; preds = %46
  %49 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.2, %42, !dbg !172
  %50 = getelementptr inbounds float* %m, i32 %49, !dbg !172
  %51 = load float* %50, align 4, !dbg !172
  %52 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.2, !dbg !172
  %53 = getelementptr inbounds [16 x float] addrspace(3)* %52, i32 0, i32 0, !dbg !172
  %54 = getelementptr inbounds float addrspace(3)* %53, i32 %42, !dbg !172
  store float %51, float addrspace(3)* %54, align 4, !dbg !172
  %55 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.2, %matrix_dim, !dbg !174
  call void @llvm.dbg.value(metadata !{i32 %55}, i64 0, metadata !146), !dbg !174
  br label %56, !dbg !175

; <label>:56                                      ; preds = %48
  %57 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.2, 1, !dbg !175
  call void @llvm.dbg.value(metadata !{i32 %57}, i64 0, metadata !149), !dbg !175
  br label %46, !dbg !175

; <label>:58                                      ; preds = %46
  %59 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !176
  %60 = add i32 %59, 1, !dbg !176
  %61 = mul i32 %60, 16, !dbg !176
  %62 = add i32 %offset, %61, !dbg !176
  %63 = mul i32 %62, %matrix_dim, !dbg !176
  %64 = add i32 %63, %offset, !dbg !176
  call void @llvm.dbg.value(metadata !{i32 %64}, i64 0, metadata !146), !dbg !176
  %move4 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !177
  call void @llvm.dbg.value(metadata !{i32 %move4}, i64 0, metadata !149), !dbg !177
  br label %65, !dbg !179

; <label>:65                                      ; preds = %75, %58
  %__cuda_local_var_37322_6_non_const_i.3 = phi i32 [ %move4, %58 ], [ %76, %75 ], !dbg !179
  %__cuda_local_var_37322_11_non_const_array_offset.3 = phi i32 [ %64, %58 ], [ %74, %75 ], !dbg !179
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.3}, i64 0, metadata !149)
  %66 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.3, 16, !dbg !179
  br i1 %66, label %67, label %77, !dbg !179

; <label>:67                                      ; preds = %65
  %68 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.3, %42, !dbg !181
  %69 = getelementptr inbounds float* %m, i32 %68, !dbg !181
  %70 = load float* %69, align 4, !dbg !181
  %71 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.3, !dbg !181
  %72 = getelementptr inbounds [16 x float] addrspace(3)* %71, i32 0, i32 0, !dbg !181
  %73 = getelementptr inbounds float addrspace(3)* %72, i32 %42, !dbg !181
  store float %70, float addrspace(3)* %73, align 4, !dbg !181
  %74 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.3, %matrix_dim, !dbg !183
  call void @llvm.dbg.value(metadata !{i32 %74}, i64 0, metadata !146), !dbg !183
  br label %75, !dbg !184

; <label>:75                                      ; preds = %67
  %76 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.3, 1, !dbg !184
  call void @llvm.dbg.value(metadata !{i32 %76}, i64 0, metadata !149), !dbg !184
  br label %65, !dbg !184

; <label>:77                                      ; preds = %65
  br label %78, !dbg !184

; <label>:78                                      ; preds = %77, %39
  call void @llvm.cuda.syncthreads(), !dbg !185
  %79 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !186
  %80 = icmp ult i32 %79, 16, !dbg !186
  br i1 %80, label %81, label %109, !dbg !186

; <label>:81                                      ; preds = %78
  %82 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !188
  call void @llvm.dbg.value(metadata !{i32 %82}, i64 0, metadata !144), !dbg !188
  %move3 = call i32 @llvm.nvvm.move.i32(i32 1), !dbg !190
  call void @llvm.dbg.value(metadata !{i32 %move3}, i64 0, metadata !149), !dbg !190
  br label %83, !dbg !192

; <label>:83                                      ; preds = %106, %81
  %__cuda_local_var_37322_6_non_const_i.4 = phi i32 [ %move3, %81 ], [ %107, %106 ], !dbg !192
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.4}, i64 0, metadata !149)
  %84 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.4, 16, !dbg !192
  br i1 %84, label %85, label %108, !dbg !192

; <label>:85                                      ; preds = %83
  %move9 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !194
  call void @llvm.dbg.value(metadata !{i32 %move9}, i64 0, metadata !197), !dbg !194
  br label %86, !dbg !198

; <label>:86                                      ; preds = %103, %85
  %__cuda_local_var_37322_8_non_const_j.0 = phi i32 [ %move9, %85 ], [ %104, %103 ], !dbg !198
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_8_non_const_j.0}, i64 0, metadata !197)
  %87 = icmp slt i32 %__cuda_local_var_37322_8_non_const_j.0, %__cuda_local_var_37322_6_non_const_i.4, !dbg !198
  br i1 %87, label %88, label %105, !dbg !198

; <label>:88                                      ; preds = %86
  %89 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.4, !dbg !200
  %90 = getelementptr inbounds [16 x float] addrspace(3)* %89, i32 0, i32 0, !dbg !200
  %91 = getelementptr inbounds float addrspace(3)* %90, i32 %__cuda_local_var_37322_8_non_const_j.0, !dbg !200
  %92 = load float addrspace(3)* %91, align 4, !dbg !200
  %93 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row, i32 0, i32 0), i32 %__cuda_local_var_37322_8_non_const_j.0, !dbg !200
  %94 = getelementptr inbounds [16 x float] addrspace(3)* %93, i32 0, i32 0, !dbg !200
  %95 = getelementptr inbounds float addrspace(3)* %94, i32 %82, !dbg !200
  %96 = load float addrspace(3)* %95, align 4, !dbg !200
  %97 = fmul float %92, %96, !dbg !200
  %98 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.4, !dbg !200
  %99 = getelementptr inbounds [16 x float] addrspace(3)* %98, i32 0, i32 0, !dbg !200
  %100 = getelementptr inbounds float addrspace(3)* %99, i32 %82, !dbg !200
  %101 = load float addrspace(3)* %100, align 4, !dbg !200
  %102 = fsub float %101, %97, !dbg !200
  store float %102, float addrspace(3)* %100, align 4, !dbg !200
  br label %103, !dbg !202

; <label>:103                                     ; preds = %88
  %104 = add nsw i32 %__cuda_local_var_37322_8_non_const_j.0, 1, !dbg !202
  call void @llvm.dbg.value(metadata !{i32 %104}, i64 0, metadata !197), !dbg !202
  br label %86, !dbg !202

; <label>:105                                     ; preds = %86
  br label %106, !dbg !203

; <label>:106                                     ; preds = %105
  %107 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.4, 1, !dbg !203
  call void @llvm.dbg.value(metadata !{i32 %107}, i64 0, metadata !149), !dbg !203
  br label %83, !dbg !203

; <label>:108                                     ; preds = %83
  br label %155, !dbg !203

; <label>:109                                     ; preds = %78
  %110 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !204
  %111 = sub i32 %110, 16, !dbg !204
  call void @llvm.dbg.value(metadata !{i32 %111}, i64 0, metadata !144), !dbg !204
  %move2 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !206
  call void @llvm.dbg.value(metadata !{i32 %move2}, i64 0, metadata !149), !dbg !206
  br label %112, !dbg !208

; <label>:112                                     ; preds = %152, %109
  %__cuda_local_var_37322_6_non_const_i.5 = phi i32 [ %move2, %109 ], [ %153, %152 ], !dbg !208
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.5}, i64 0, metadata !149)
  %113 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.5, 16, !dbg !208
  br i1 %113, label %114, label %154, !dbg !208

; <label>:114                                     ; preds = %112
  %move8 = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !210
  call void @llvm.dbg.value(metadata !{i32 %move8}, i64 0, metadata !197), !dbg !210
  br label %115, !dbg !213

; <label>:115                                     ; preds = %132, %114
  %__cuda_local_var_37322_8_non_const_j.1 = phi i32 [ %move8, %114 ], [ %133, %132 ], !dbg !213
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_8_non_const_j.1}, i64 0, metadata !197)
  %116 = icmp slt i32 %__cuda_local_var_37322_8_non_const_j.1, %__cuda_local_var_37322_6_non_const_i.5, !dbg !213
  br i1 %116, label %117, label %134, !dbg !213

; <label>:117                                     ; preds = %115
  %118 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col, i32 0, i32 0), i32 %111, !dbg !215
  %119 = getelementptr inbounds [16 x float] addrspace(3)* %118, i32 0, i32 0, !dbg !215
  %120 = getelementptr inbounds float addrspace(3)* %119, i32 %__cuda_local_var_37322_8_non_const_j.1, !dbg !215
  %121 = load float addrspace(3)* %120, align 4, !dbg !215
  %122 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia, i32 0, i32 0), i32 %__cuda_local_var_37322_8_non_const_j.1, !dbg !215
  %123 = getelementptr inbounds [16 x float] addrspace(3)* %122, i32 0, i32 0, !dbg !215
  %124 = getelementptr inbounds float addrspace(3)* %123, i32 %__cuda_local_var_37322_6_non_const_i.5, !dbg !215
  %125 = load float addrspace(3)* %124, align 4, !dbg !215
  %126 = fmul float %121, %125, !dbg !215
  %127 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col, i32 0, i32 0), i32 %111, !dbg !215
  %128 = getelementptr inbounds [16 x float] addrspace(3)* %127, i32 0, i32 0, !dbg !215
  %129 = getelementptr inbounds float addrspace(3)* %128, i32 %__cuda_local_var_37322_6_non_const_i.5, !dbg !215
  %130 = load float addrspace(3)* %129, align 4, !dbg !215
  %131 = fsub float %130, %126, !dbg !215
  store float %131, float addrspace(3)* %129, align 4, !dbg !215
  br label %132, !dbg !217

; <label>:132                                     ; preds = %117
  %133 = add nsw i32 %__cuda_local_var_37322_8_non_const_j.1, 1, !dbg !217
  call void @llvm.dbg.value(metadata !{i32 %133}, i64 0, metadata !197), !dbg !217
  br label %115, !dbg !217

; <label>:134                                     ; preds = %115
  %135 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col, i32 0, i32 0), i32 %111, !dbg !218
  %136 = getelementptr inbounds [16 x float] addrspace(3)* %135, i32 0, i32 0, !dbg !218
  %137 = getelementptr inbounds float addrspace(3)* %136, i32 %__cuda_local_var_37322_6_non_const_i.5, !dbg !218
  %138 = load float addrspace(3)* %137, align 4, !dbg !218
  %139 = fpext float %138 to double, !dbg !218
  %140 = fptrunc double %139 to float, !dbg !218
  %141 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.5, !dbg !218
  %142 = getelementptr inbounds [16 x float] addrspace(3)* %141, i32 0, i32 0, !dbg !218
  %143 = getelementptr inbounds float addrspace(3)* %142, i32 %__cuda_local_var_37322_6_non_const_i.5, !dbg !218
  %144 = load float addrspace(3)* %143, align 4, !dbg !218
  %145 = fpext float %144 to double, !dbg !218
  %146 = fptrunc double %145 to float, !dbg !218
  call void @llvm.dbg.value(metadata !{float %140}, i64 0, metadata !219), !dbg !221
  call void @llvm.dbg.value(metadata !{float %146}, i64 0, metadata !222), !dbg !223
  %147 = call i8* @llvm.nvvm.ptr.global.to.gen.p0i8.p1i8(i8 addrspace(1)* getelementptr inbounds ([11 x i8] addrspace(1)* @"$str", i32 0, i32 0)), !dbg !224
  %148 = call float @llvm.nvvm.div.approx.ftz.f(float %140, float %146), !dbg !224
  br label %fdividef.exit, !dbg !224

fdividef.exit:                                    ; preds = %134
  %retval.0.i.i = phi float [ %148, %134 ], !dbg !224
  %149 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col, i32 0, i32 0), i32 %111, !dbg !220
  %150 = getelementptr inbounds [16 x float] addrspace(3)* %149, i32 0, i32 0, !dbg !220
  %151 = getelementptr inbounds float addrspace(3)* %150, i32 %__cuda_local_var_37322_6_non_const_i.5, !dbg !220
  store float %retval.0.i.i, float addrspace(3)* %151, align 4, !dbg !220
  br label %152, !dbg !225

; <label>:152                                     ; preds = %fdividef.exit
  %153 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.5, 1, !dbg !225
  call void @llvm.dbg.value(metadata !{i32 %153}, i64 0, metadata !149), !dbg !225
  br label %112, !dbg !225

; <label>:154                                     ; preds = %112
  br label %155, !dbg !225

; <label>:155                                     ; preds = %154, %108
  call void @llvm.cuda.syncthreads(), !dbg !226
  %156 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !227
  %157 = icmp ult i32 %156, 16, !dbg !227
  br i1 %157, label %158, label %181, !dbg !227

; <label>:158                                     ; preds = %155
  %159 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !229
  call void @llvm.dbg.value(metadata !{i32 %159}, i64 0, metadata !144), !dbg !229
  %160 = add nsw i32 %offset, 1, !dbg !231
  %161 = mul nsw i32 %160, %matrix_dim, !dbg !231
  %162 = add nsw i32 %161, %offset, !dbg !231
  call void @llvm.dbg.value(metadata !{i32 %162}, i64 0, metadata !146), !dbg !231
  %move1 = call i32 @llvm.nvvm.move.i32(i32 1), !dbg !232
  call void @llvm.dbg.value(metadata !{i32 %move1}, i64 0, metadata !149), !dbg !232
  br label %163, !dbg !234

; <label>:163                                     ; preds = %178, %158
  %__cuda_local_var_37322_6_non_const_i.6 = phi i32 [ %move1, %158 ], [ %179, %178 ], !dbg !234
  %__cuda_local_var_37322_11_non_const_array_offset.4 = phi i32 [ %162, %158 ], [ %177, %178 ], !dbg !234
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.6}, i64 0, metadata !149)
  %164 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.6, 16, !dbg !234
  br i1 %164, label %165, label %180, !dbg !234

; <label>:165                                     ; preds = %163
  %166 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.6, !dbg !236
  %167 = getelementptr inbounds [16 x float] addrspace(3)* %166, i32 0, i32 0, !dbg !236
  %168 = getelementptr inbounds float addrspace(3)* %167, i32 %159, !dbg !236
  %169 = load float addrspace(3)* %168, align 4, !dbg !236
  %170 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !236
  %171 = add i32 %170, 1, !dbg !236
  %172 = mul i32 %171, 16, !dbg !236
  %173 = add i32 %__cuda_local_var_37322_11_non_const_array_offset.4, %172, !dbg !236
  %174 = add i32 %173, %159, !dbg !236
  %175 = zext i32 %174 to i64, !dbg !236
  %176 = getelementptr inbounds float* %m, i64 %175, !dbg !236
  store float %169, float* %176, align 4, !dbg !236
  %177 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.4, %matrix_dim, !dbg !238
  call void @llvm.dbg.value(metadata !{i32 %177}, i64 0, metadata !146), !dbg !238
  br label %178, !dbg !239

; <label>:178                                     ; preds = %165
  %179 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.6, 1, !dbg !239
  call void @llvm.dbg.value(metadata !{i32 %179}, i64 0, metadata !149), !dbg !239
  br label %163, !dbg !239

; <label>:180                                     ; preds = %163
  br label %203, !dbg !239

; <label>:181                                     ; preds = %155
  %182 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !240
  %183 = sub i32 %182, 16, !dbg !240
  call void @llvm.dbg.value(metadata !{i32 %183}, i64 0, metadata !144), !dbg !240
  %184 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !242
  %185 = add i32 %184, 1, !dbg !242
  %186 = mul i32 %185, 16, !dbg !242
  %187 = add i32 %offset, %186, !dbg !242
  %188 = mul i32 %187, %matrix_dim, !dbg !242
  %189 = add i32 %188, %offset, !dbg !242
  call void @llvm.dbg.value(metadata !{i32 %189}, i64 0, metadata !146), !dbg !242
  %move = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !243
  call void @llvm.dbg.value(metadata !{i32 %move}, i64 0, metadata !149), !dbg !243
  br label %190, !dbg !245

; <label>:190                                     ; preds = %200, %181
  %__cuda_local_var_37322_6_non_const_i.7 = phi i32 [ %move, %181 ], [ %201, %200 ], !dbg !245
  %__cuda_local_var_37322_11_non_const_array_offset.5 = phi i32 [ %189, %181 ], [ %199, %200 ], !dbg !245
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37322_6_non_const_i.7}, i64 0, metadata !149)
  %191 = icmp slt i32 %__cuda_local_var_37322_6_non_const_i.7, 16, !dbg !245
  br i1 %191, label %192, label %202, !dbg !245

; <label>:192                                     ; preds = %190
  %193 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col, i32 0, i32 0), i32 %__cuda_local_var_37322_6_non_const_i.7, !dbg !247
  %194 = getelementptr inbounds [16 x float] addrspace(3)* %193, i32 0, i32 0, !dbg !247
  %195 = getelementptr inbounds float addrspace(3)* %194, i32 %183, !dbg !247
  %196 = load float addrspace(3)* %195, align 4, !dbg !247
  %197 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.5, %183, !dbg !247
  %198 = getelementptr inbounds float* %m, i32 %197, !dbg !247
  store float %196, float* %198, align 4, !dbg !247
  %199 = add nsw i32 %__cuda_local_var_37322_11_non_const_array_offset.5, %matrix_dim, !dbg !249
  call void @llvm.dbg.value(metadata !{i32 %199}, i64 0, metadata !146), !dbg !249
  br label %200, !dbg !250

; <label>:200                                     ; preds = %192
  %201 = add nsw i32 %__cuda_local_var_37322_6_non_const_i.7, 1, !dbg !250
  call void @llvm.dbg.value(metadata !{i32 %201}, i64 0, metadata !149), !dbg !250
  br label %190, !dbg !250

; <label>:202                                     ; preds = %190
  br label %203, !dbg !250

; <label>:203                                     ; preds = %202, %180
  ret void, !dbg !251
}

declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() nounwind readnone

define void @_Z12lud_internalPfii(float* %m, i32 %matrix_dim, i32 %offset) alwaysinline {
  call void @llvm.dbg.value(metadata !{float* %m}, i64 0, metadata !252), !dbg !253
  call void @llvm.dbg.value(metadata !{i32 %matrix_dim}, i64 0, metadata !254), !dbg !255
  call void @llvm.dbg.value(metadata !{i32 %offset}, i64 0, metadata !256), !dbg !255
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y(), !dbg !257
  %2 = add i32 %1, 1, !dbg !257
  %3 = mul i32 %2, 16, !dbg !257
  %4 = add i32 %offset, %3, !dbg !257
  call void @llvm.dbg.value(metadata !{i32 %4}, i64 0, metadata !258), !dbg !257
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !dbg !259
  %6 = add i32 %5, 1, !dbg !259
  %7 = mul i32 %6, 16, !dbg !259
  %8 = add i32 %offset, %7, !dbg !259
  call void @llvm.dbg.value(metadata !{i32 %8}, i64 0, metadata !260), !dbg !259
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !261
  %10 = add i32 %offset, %9, !dbg !261
  %11 = mul i32 %10, %matrix_dim, !dbg !261
  %12 = add i32 %11, %8, !dbg !261
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !261
  %14 = add i32 %12, %13, !dbg !261
  %15 = zext i32 %14 to i64, !dbg !261
  %16 = getelementptr inbounds float* %m, i64 %15, !dbg !261
  %17 = load float* %16, align 4, !dbg !261
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !261
  %19 = zext i32 %18 to i64, !dbg !261
  %20 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row, i32 0, i32 0), i64 %19, !dbg !261
  %21 = getelementptr inbounds [16 x float] addrspace(3)* %20, i32 0, i32 0, !dbg !261
  %22 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !261
  %23 = zext i32 %22 to i64, !dbg !261
  %24 = getelementptr inbounds float addrspace(3)* %21, i64 %23, !dbg !261
  store float %17, float addrspace(3)* %24, align 4, !dbg !261
  %25 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !262
  %26 = add i32 %4, %25, !dbg !262
  %27 = mul i32 %26, %matrix_dim, !dbg !262
  %28 = add i32 %27, %offset, !dbg !262
  %29 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !262
  %30 = add i32 %28, %29, !dbg !262
  %31 = zext i32 %30 to i64, !dbg !262
  %32 = getelementptr inbounds float* %m, i64 %31, !dbg !262
  %33 = load float* %32, align 4, !dbg !262
  %34 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !262
  %35 = zext i32 %34 to i64, !dbg !262
  %36 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col, i32 0, i32 0), i64 %35, !dbg !262
  %37 = getelementptr inbounds [16 x float] addrspace(3)* %36, i32 0, i32 0, !dbg !262
  %38 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !262
  %39 = zext i32 %38 to i64, !dbg !262
  %40 = getelementptr inbounds float addrspace(3)* %37, i64 %39, !dbg !262
  store float %33, float addrspace(3)* %40, align 4, !dbg !262
  call void @llvm.cuda.syncthreads(), !dbg !263
  %move1 = call float @llvm.nvvm.move.float(float 0.000000e+00), !dbg !264
  call void @llvm.dbg.value(metadata !{float %move1}, i64 0, metadata !265), !dbg !264
  %move = call i32 @llvm.nvvm.move.i32(i32 0), !dbg !266
  call void @llvm.dbg.value(metadata !{i32 %move}, i64 0, metadata !268), !dbg !266
  br label %41, !dbg !269

; <label>:41                                      ; preds = %58, %0
  %__cuda_local_var_37399_6_non_const_i.0 = phi i32 [ %move, %0 ], [ %59, %58 ], !dbg !269
  %__cuda_local_var_37400_8_non_const_sum.0 = phi float [ %move1, %0 ], [ %57, %58 ], !dbg !269
  call void @llvm.dbg.value(metadata !{i32 %__cuda_local_var_37399_6_non_const_i.0}, i64 0, metadata !268)
  %42 = icmp slt i32 %__cuda_local_var_37399_6_non_const_i.0, 16, !dbg !269
  br i1 %42, label %43, label %60, !dbg !269

; <label>:43                                      ; preds = %41
  %44 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !271
  %45 = zext i32 %44 to i64, !dbg !271
  %46 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col, i32 0, i32 0), i64 %45, !dbg !271
  %47 = getelementptr inbounds [16 x float] addrspace(3)* %46, i32 0, i32 0, !dbg !271
  %48 = getelementptr inbounds float addrspace(3)* %47, i32 %__cuda_local_var_37399_6_non_const_i.0, !dbg !271
  %49 = load float addrspace(3)* %48, align 4, !dbg !271
  %50 = getelementptr inbounds [16 x float] addrspace(3)* getelementptr inbounds ([16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row, i32 0, i32 0), i32 %__cuda_local_var_37399_6_non_const_i.0, !dbg !271
  %51 = getelementptr inbounds [16 x float] addrspace(3)* %50, i32 0, i32 0, !dbg !271
  %52 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !271
  %53 = zext i32 %52 to i64, !dbg !271
  %54 = getelementptr inbounds float addrspace(3)* %51, i64 %53, !dbg !271
  %55 = load float addrspace(3)* %54, align 4, !dbg !271
  %56 = fmul float %49, %55, !dbg !271
  %57 = fadd float %__cuda_local_var_37400_8_non_const_sum.0, %56, !dbg !271
  call void @llvm.dbg.value(metadata !{float %57}, i64 0, metadata !265), !dbg !271
  br label %58, !dbg !273

; <label>:58                                      ; preds = %43
  %59 = add nsw i32 %__cuda_local_var_37399_6_non_const_i.0, 1, !dbg !273
  call void @llvm.dbg.value(metadata !{i32 %59}, i64 0, metadata !268), !dbg !273
  br label %41, !dbg !273

; <label>:60                                      ; preds = %41
  %61 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y(), !dbg !274
  %62 = add i32 %4, %61, !dbg !274
  %63 = mul i32 %62, %matrix_dim, !dbg !274
  %64 = add i32 %63, %8, !dbg !274
  %65 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !dbg !274
  %66 = add i32 %64, %65, !dbg !274
  %67 = zext i32 %66 to i64, !dbg !274
  %68 = getelementptr inbounds float* %m, i64 %67, !dbg !274
  %69 = load float* %68, align 4, !dbg !274
  %70 = fsub float %69, %__cuda_local_var_37400_8_non_const_sum.0, !dbg !274
  store float %70, float* %68, align 4, !dbg !274
  ret void, !dbg !275
}

declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.y() nounwind readnone

declare i32 @llvm.nvvm.read.ptx.sreg.tid.y() nounwind readnone

declare i8* @llvm.nvvm.ptr.global.to.gen.p0i8.p1i8(i8 addrspace(1)*) nounwind readnone

declare float @llvm.nvvm.div.approx.ftz.f(float, float) nounwind readnone

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare i32 @llvm.nvvm.move.i32(i32) nounwind

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare float @llvm.nvvm.move.float(float) nounwind

declare void @abort()

!llvm.dbg.cu = !{!0}
!nvvm.annotations = !{!54, !55, !56, !57, !58, !57, !59, !59, !59, !59, !60, !60, !59, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !62, !62, !62, !62, !62, !62, !62, !62, !62, !62, !62, !62, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !61, !63, !63, !63, !64, !64, !64, !63, !63, !63, !64, !64, !64, !63, !63, !63, !65, !66, !66, !57, !57, !59, !59, !65, !66, !66, !57, !57, !59, !59, !65, !66, !66, !57, !57, !59, !59, !65, !66, !66, !57, !57, !59, !59, !65, !66, !66, !57, !57, !59, !59, !67, !68, !68, !69, !69, !70, !70, !67, !68, !68, !69, !69, !70, !70, !67, !68, !68, !69, !69, !70, !70, !67, !68, !68, !69, !69, !70, !70, !67, !68, !68, !69, !69, !70, !70}
!nvvm.internalize.after.link = !{}

!0 = metadata !{i32 720913, i32 0, i32 4, metadata !"lud.cu", metadata !"/data/gpli/heterogenous-ep/memory/lud/lud_global", metadata !"lgenfe: EDG 4.1", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !3, metadata !12, metadata !34} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 720915, metadata !6, metadata !"dim3", metadata !6, i32 415, i64 96, i64 32, i32 0, i32 0, i32 0, metadata !7, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!6 = metadata !{i32 720937, metadata !"/usr/local/cuda/bin/../targets/x86_64-linux/include/vector_types.h", metadata !"/data/gpli/heterogenous-ep/memory/lud/lud_global", null} ; [ DW_TAG_file_type ]
!7 = metadata !{metadata !8, metadata !10, metadata !11}
!8 = metadata !{i32 720909, metadata !6, metadata !"x", metadata !6, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ]
!9 = metadata !{i32 720932, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 720909, metadata !6, metadata !"y", metadata !6, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ]
!11 = metadata !{i32 720909, metadata !6, metadata !"z", metadata !6, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ]
!12 = metadata !{metadata !13}
!13 = metadata !{metadata !14, metadata !19, metadata !26, metadata !27, metadata !28, metadata !33}
!14 = metadata !{i32 720942, i32 0, metadata !15, metadata !"fdividef", metadata !"fdividef", metadata !"fdividef", metadata !15, i32 4512, metadata !16, i1 true, i1 true, i32 0, i32 0, i32 0, i32 0, i1 false, null, null, null, metadata !1} ; [ DW_TAG_subprogram ]
!15 = metadata !{i32 720937, metadata !"/usr/local/cuda/bin/../targets/x86_64-linux/include/device_functions.h", metadata !"/data/gpli/heterogenous-ep/memory/lud/lud_global", null} ; [ DW_TAG_file_type ]
!16 = metadata !{i32 720917, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !17, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!17 = metadata !{metadata !18, metadata !18, metadata !18}
!18 = metadata !{i32 720932, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!19 = metadata !{i32 720942, i32 0, metadata !20, metadata !"_Z12lud_diagonalPfii", metadata !"_Z12lud_diagonalPfii", metadata !"_Z12lud_diagonalPfii", metadata !20, i32 28, metadata !21, i1 false, i1 true, i32 0, i32 0, i32 0, i32 0, i1 false, void (float*, i32, i32)* @_Z12lud_diagonalPfii, null, null, metadata !1} ; [ DW_TAG_subprogram ]
!20 = metadata !{i32 720937, metadata !"lud_kernel.cu", metadata !"/data/gpli/heterogenous-ep/memory/lud/lud_global", null} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 720917, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !22, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !23, metadata !24, metadata !25, metadata !25}
!23 = metadata !{i32 720955, null, metadata !"void", null, i32 0, i64 0, i64 0, i64 0, i32 0, i32 0} ; [ DW_TAG_unspecified_type ]
!24 = metadata !{i32 720911, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18, i32 0} ; [ DW_TAG_pointer_type ]
!25 = metadata !{i32 720932, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!26 = metadata !{i32 720942, i32 0, metadata !20, metadata !"_Z13lud_perimeterPfii", metadata !"_Z13lud_perimeterPfii", metadata !"_Z13lud_perimeterPfii", metadata !20, i32 70, metadata !21, i1 false, i1 true, i32 0, i32 0, i32 0, i32 0, i1 false, void (float*, i32, i32)* @_Z13lud_perimeterPfii, null, null, metadata !1} ; [ DW_TAG_subprogram ]
!27 = metadata !{i32 720942, i32 0, metadata !20, metadata !"_Z12lud_internalPfii", metadata !"_Z12lud_internalPfii", metadata !"_Z12lud_internalPfii", metadata !20, i32 180, metadata !21, i1 false, i1 true, i32 0, i32 0, i32 0, i32 0, i1 false, void (float*, i32, i32)* @_Z12lud_internalPfii, null, null, metadata !1} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 720942, i32 0, metadata !6, metadata !"_ZN4dim3C1Ejjj", metadata !"_ZN4dim3C1Ejjj", metadata !"_ZN4dim3C1Ejjj", metadata !6, i32 419, metadata !29, i1 false, i1 true, i32 0, i32 0, i32 0, i32 0, i1 false, null, null, null, metadata !1} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 720917, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i32 0, i32 0, i32 0, metadata !30, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{metadata !23, metadata !31, metadata !9, metadata !9, metadata !9}
!31 = metadata !{i32 720934, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_const_type ]
!32 = metadata !{i32 720911, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !5, i32 0} ; [ DW_TAG_pointer_type ]
!33 = metadata !{i32 720942, i32 0, metadata !6, metadata !"_ZN4dim3C2Ejjj", metadata !"_ZN4dim3C2Ejjj", metadata !"_ZN4dim3C2Ejjj", metadata !6, i32 421, metadata !29, i1 false, i1 true, i32 0, i32 0, i32 0, i32 0, i1 false, null, null, null, metadata !1} ; [ DW_TAG_subprogram ]
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !36, metadata !43, metadata !47, metadata !48, metadata !49, metadata !53}
!36 = metadata !{i32 720948, i32 0, metadata !37, metadata !"shadow", metadata !"shadow", metadata !"", metadata !20, i32 31, metadata !40, i32 1, i32 1, [16 x [16 x float]] addrspace(3)* @_ZZ12lud_diagonalPfiiE6shadow, i32 3} ; [ DW_TAG_variable ]
!37 = metadata !{i32 720907, metadata !38, i32 29, i32 1, metadata !20, i32 3} ; [ DW_TAG_lexical_block ]
!38 = metadata !{i32 720907, metadata !39, i32 28, i32 1, metadata !20, i32 2} ; [ DW_TAG_lexical_block ]
!39 = metadata !{i32 720907, metadata !19, i32 28, i32 12, metadata !20, i32 1} ; [ DW_TAG_lexical_block ]
!40 = metadata !{i32 720897, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !18, metadata !41, i32 0, i32 0} ; [ DW_TAG_array_type ]
!41 = metadata !{metadata !42, metadata !42}
!42 = metadata !{i32 720929, i64 0, i64 15}       ; [ DW_TAG_subrange_type ]
!43 = metadata !{i32 720948, i32 0, metadata !44, metadata !"dia", metadata !"dia", metadata !"", metadata !20, i32 72, metadata !40, i32 1, i32 1, [16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE3dia, i32 3} ; [ DW_TAG_variable ]
!44 = metadata !{i32 720907, metadata !45, i32 71, i32 1, metadata !20, i32 25} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 720907, metadata !46, i32 70, i32 1, metadata !20, i32 24} ; [ DW_TAG_lexical_block ]
!46 = metadata !{i32 720907, metadata !26, i32 70, i32 12, metadata !20, i32 23} ; [ DW_TAG_lexical_block ]
!47 = metadata !{i32 720948, i32 0, metadata !44, metadata !"peri_row", metadata !"peri_row", metadata !"", metadata !20, i32 73, metadata !40, i32 1, i32 1, [16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_row, i32 3} ; [ DW_TAG_variable ]
!48 = metadata !{i32 720948, i32 0, metadata !44, metadata !"peri_col", metadata !"peri_col", metadata !"", metadata !20, i32 74, metadata !40, i32 1, i32 1, [16 x [16 x float]] addrspace(3)* @_ZZ13lud_perimeterPfiiE8peri_col, i32 3} ; [ DW_TAG_variable ]
!49 = metadata !{i32 720948, i32 0, metadata !50, metadata !"peri_row", metadata !"peri_row", metadata !"", metadata !20, i32 182, metadata !40, i32 1, i32 1, [16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_row, i32 3} ; [ DW_TAG_variable ]
!50 = metadata !{i32 720907, metadata !51, i32 181, i32 1, metadata !20, i32 67} ; [ DW_TAG_lexical_block ]
!51 = metadata !{i32 720907, metadata !52, i32 180, i32 1, metadata !20, i32 66} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 720907, metadata !27, i32 180, i32 12, metadata !20, i32 65} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 720948, i32 0, metadata !50, metadata !"peri_col", metadata !"peri_col", metadata !"", metadata !20, i32 183, metadata !40, i32 1, i32 1, [16 x [16 x float]] addrspace(3)* @_ZZ12lud_internalPfiiE8peri_col, i32 3} ; [ DW_TAG_variable ]
!54 = metadata !{void (float*, i32, i32)* @_Z12lud_diagonalPfii, metadata !"kernel", i32 1}
!55 = metadata !{void (float*, i32, i32)* @_Z13lud_perimeterPfii, metadata !"kernel", i32 1}
!56 = metadata !{void (float*, i32, i32)* @_Z12lud_internalPfii, metadata !"kernel", i32 1}
!57 = metadata !{null, metadata !"align", i32 8}
!58 = metadata !{null, metadata !"align", i32 8, metadata !"align", i32 65544, metadata !"align", i32 131080}
!59 = metadata !{null, metadata !"align", i32 16}
!60 = metadata !{null, metadata !"align", i32 16, metadata !"align", i32 65552, metadata !"align", i32 131088}
!61 = metadata !{null, metadata !"align", i32 16, metadata !"align", i32 131088}
!62 = metadata !{null, metadata !"align", i32 16, metadata !"align", i32 131080}
!63 = metadata !{null, metadata !"align", i32 16, metadata !"align", i32 131088, metadata !"align", i32 196624, metadata !"align", i32 262160}
!64 = metadata !{null, metadata !"align", i32 16, metadata !"align", i32 131088, metadata !"align", i32 262160, metadata !"align", i32 327696}
!65 = metadata !{null, metadata !"align", i32 2}
!66 = metadata !{null, metadata !"align", i32 4}
!67 = metadata !{null, metadata !"align", i32 65538}
!68 = metadata !{null, metadata !"align", i32 65540}
!69 = metadata !{null, metadata !"align", i32 65544}
!70 = metadata !{null, metadata !"align", i32 65552}
!71 = metadata !{i32 721153, metadata !19, metadata !"m", metadata !20, i32 28, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!72 = metadata !{i32 28, i32 8, metadata !19, null}
!73 = metadata !{i32 721153, metadata !19, metadata !"matrix_dim", metadata !20, i32 28, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!74 = metadata !{i32 28, i32 5, metadata !19, null}
!75 = metadata !{i32 721153, metadata !19, metadata !"offset", metadata !20, i32 28, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!76 = metadata !{i32 33, i32 1, metadata !37, null}
!77 = metadata !{i32 721152, metadata !37, metadata !"array_offset", metadata !20, i32 33, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!78 = metadata !{i32 34, i32 6, metadata !79, null}
!79 = metadata !{i32 720907, metadata !37, i32 33, i32 1, metadata !20, i32 4} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 721152, metadata !37, metadata !"i", metadata !20, i32 30, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!81 = metadata !{i32 34, i32 1, metadata !82, null}
!82 = metadata !{i32 720907, metadata !79, i32 34, i32 1, metadata !20, i32 5} ; [ DW_TAG_lexical_block ]
!83 = metadata !{i32 35, i32 1, metadata !84, null}
!84 = metadata !{i32 720907, metadata !82, i32 34, i32 1, metadata !20, i32 6} ; [ DW_TAG_lexical_block ]
!85 = metadata !{i32 36, i32 1, metadata !84, null}
!86 = metadata !{i32 34, i32 93, metadata !82, null}
!87 = metadata !{i32 38, i32 1, metadata !37, null}
!88 = metadata !{i32 39, i32 6, metadata !89, null}
!89 = metadata !{i32 720907, metadata !37, i32 38, i32 1, metadata !20, i32 7} ; [ DW_TAG_lexical_block ]
!90 = metadata !{i32 39, i32 1, metadata !91, null}
!91 = metadata !{i32 720907, metadata !89, i32 39, i32 1, metadata !20, i32 8} ; [ DW_TAG_lexical_block ]
!92 = metadata !{i32 41, i32 1, metadata !93, null}
!93 = metadata !{i32 720907, metadata !94, i32 39, i32 1, metadata !20, i32 10} ; [ DW_TAG_lexical_block ]
!94 = metadata !{i32 720907, metadata !91, i32 39, i32 1, metadata !20, i32 9} ; [ DW_TAG_lexical_block ]
!95 = metadata !{i32 42, i32 6, metadata !96, null}
!96 = metadata !{i32 720907, metadata !97, i32 41, i32 1, metadata !20, i32 12} ; [ DW_TAG_lexical_block ]
!97 = metadata !{i32 720907, metadata !93, i32 41, i32 1, metadata !20, i32 11} ; [ DW_TAG_lexical_block ]
!98 = metadata !{i32 721152, metadata !37, metadata !"j", metadata !20, i32 30, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!99 = metadata !{i32 42, i32 1, metadata !100, null}
!100 = metadata !{i32 720907, metadata !96, i32 42, i32 1, metadata !20, i32 13} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 43, i32 1, metadata !102, null}
!102 = metadata !{i32 720907, metadata !100, i32 42, i32 1, metadata !20, i32 14} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 42, i32 127, metadata !100, null}
!104 = metadata !{i32 44, i32 1, metadata !97, null}
!105 = metadata !{i32 721153, metadata !14, metadata !"a", metadata !15, i32 4512, metadata !18, i32 0, metadata !106} ; [ DW_TAG_arg_variable ]
!106 = metadata !{i32 44, i32 130, metadata !97, null}
!107 = metadata !{i32 4512, i32 71, metadata !14, metadata !106}
!108 = metadata !{i32 721153, metadata !14, metadata !"b", metadata !15, i32 4512, metadata !18, i32 0, metadata !106} ; [ DW_TAG_arg_variable ]
!109 = metadata !{i32 4512, i32 80, metadata !14, metadata !106}
!110 = metadata !{i32 4515, i32 10, metadata !111, metadata !106}
!111 = metadata !{i32 720907, metadata !14, i32 4513, i32 1, metadata !15, i32 0} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 47, i32 1, metadata !94, null}
!113 = metadata !{i32 48, i32 1, metadata !114, null}
!114 = metadata !{i32 720907, metadata !94, i32 47, i32 1, metadata !20, i32 15} ; [ DW_TAG_lexical_block ]
!115 = metadata !{i32 50, i32 6, metadata !116, null}
!116 = metadata !{i32 720907, metadata !117, i32 48, i32 1, metadata !20, i32 17} ; [ DW_TAG_lexical_block ]
!117 = metadata !{i32 720907, metadata !114, i32 48, i32 1, metadata !20, i32 16} ; [ DW_TAG_lexical_block ]
!118 = metadata !{i32 50, i32 1, metadata !119, null}
!119 = metadata !{i32 720907, metadata !116, i32 50, i32 1, metadata !20, i32 18} ; [ DW_TAG_lexical_block ]
!120 = metadata !{i32 51, i32 1, metadata !121, null}
!121 = metadata !{i32 720907, metadata !119, i32 50, i32 1, metadata !20, i32 19} ; [ DW_TAG_lexical_block ]
!122 = metadata !{i32 50, i32 133, metadata !119, null}
!123 = metadata !{i32 53, i32 1, metadata !94, null}
!124 = metadata !{i32 39, i32 93, metadata !91, null}
!125 = metadata !{i32 62, i32 1, metadata !37, null}
!126 = metadata !{i32 63, i32 6, metadata !127, null}
!127 = metadata !{i32 720907, metadata !37, i32 62, i32 1, metadata !20, i32 20} ; [ DW_TAG_lexical_block ]
!128 = metadata !{i32 63, i32 1, metadata !129, null}
!129 = metadata !{i32 720907, metadata !127, i32 63, i32 1, metadata !20, i32 21} ; [ DW_TAG_lexical_block ]
!130 = metadata !{i32 64, i32 1, metadata !131, null}
!131 = metadata !{i32 720907, metadata !129, i32 63, i32 1, metadata !20, i32 22} ; [ DW_TAG_lexical_block ]
!132 = metadata !{i32 65, i32 1, metadata !131, null}
!133 = metadata !{i32 63, i32 93, metadata !129, null}
!134 = metadata !{i32 67, i32 2, metadata !39, null}
!135 = metadata !{i32 721153, metadata !26, metadata !"m", metadata !20, i32 70, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!136 = metadata !{i32 70, i32 8, metadata !26, null}
!137 = metadata !{i32 721153, metadata !26, metadata !"matrix_dim", metadata !20, i32 70, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!138 = metadata !{i32 70, i32 5, metadata !26, null}
!139 = metadata !{i32 721153, metadata !26, metadata !"offset", metadata !20, i32 70, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 79, i32 1, metadata !141, null}
!141 = metadata !{i32 720907, metadata !44, i32 77, i32 2, metadata !20, i32 26} ; [ DW_TAG_lexical_block ]
!142 = metadata !{i32 80, i32 1, metadata !143, null}
!143 = metadata !{i32 720907, metadata !141, i32 79, i32 1, metadata !20, i32 27} ; [ DW_TAG_lexical_block ]
!144 = metadata !{i32 721152, metadata !44, metadata !"idx", metadata !20, i32 77, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!145 = metadata !{i32 82, i32 1, metadata !143, null}
!146 = metadata !{i32 721152, metadata !44, metadata !"array_offset", metadata !20, i32 76, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!147 = metadata !{i32 83, i32 6, metadata !148, null}
!148 = metadata !{i32 720907, metadata !143, i32 82, i32 1, metadata !20, i32 28} ; [ DW_TAG_lexical_block ]
!149 = metadata !{i32 721152, metadata !44, metadata !"i", metadata !20, i32 76, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!150 = metadata !{i32 83, i32 1, metadata !151, null}
!151 = metadata !{i32 720907, metadata !148, i32 83, i32 1, metadata !20, i32 29} ; [ DW_TAG_lexical_block ]
!152 = metadata !{i32 84, i32 1, metadata !153, null}
!153 = metadata !{i32 720907, metadata !151, i32 83, i32 1, metadata !20, i32 30} ; [ DW_TAG_lexical_block ]
!154 = metadata !{i32 85, i32 1, metadata !153, null}
!155 = metadata !{i32 83, i32 92, metadata !151, null}
!156 = metadata !{i32 88, i32 1, metadata !143, null}
!157 = metadata !{i32 89, i32 6, metadata !158, null}
!158 = metadata !{i32 720907, metadata !143, i32 88, i32 1, metadata !20, i32 31} ; [ DW_TAG_lexical_block ]
!159 = metadata !{i32 89, i32 1, metadata !160, null}
!160 = metadata !{i32 720907, metadata !158, i32 89, i32 1, metadata !20, i32 32} ; [ DW_TAG_lexical_block ]
!161 = metadata !{i32 90, i32 1, metadata !162, null}
!162 = metadata !{i32 720907, metadata !160, i32 89, i32 1, metadata !20, i32 33} ; [ DW_TAG_lexical_block ]
!163 = metadata !{i32 91, i32 1, metadata !162, null}
!164 = metadata !{i32 89, i32 93, metadata !160, null}
!165 = metadata !{i32 95, i32 1, metadata !166, null}
!166 = metadata !{i32 720907, metadata !141, i32 94, i32 1, metadata !20, i32 34} ; [ DW_TAG_lexical_block ]
!167 = metadata !{i32 97, i32 1, metadata !166, null}
!168 = metadata !{i32 98, i32 6, metadata !169, null}
!169 = metadata !{i32 720907, metadata !166, i32 97, i32 1, metadata !20, i32 35} ; [ DW_TAG_lexical_block ]
!170 = metadata !{i32 98, i32 1, metadata !171, null}
!171 = metadata !{i32 720907, metadata !169, i32 98, i32 1, metadata !20, i32 36} ; [ DW_TAG_lexical_block ]
!172 = metadata !{i32 99, i32 1, metadata !173, null}
!173 = metadata !{i32 720907, metadata !171, i32 98, i32 1, metadata !20, i32 37} ; [ DW_TAG_lexical_block ]
!174 = metadata !{i32 100, i32 1, metadata !173, null}
!175 = metadata !{i32 98, i32 93, metadata !171, null}
!176 = metadata !{i32 103, i32 1, metadata !166, null}
!177 = metadata !{i32 104, i32 6, metadata !178, null}
!178 = metadata !{i32 720907, metadata !166, i32 103, i32 1, metadata !20, i32 38} ; [ DW_TAG_lexical_block ]
!179 = metadata !{i32 104, i32 1, metadata !180, null}
!180 = metadata !{i32 720907, metadata !178, i32 104, i32 1, metadata !20, i32 39} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 105, i32 1, metadata !182, null}
!182 = metadata !{i32 720907, metadata !180, i32 104, i32 1, metadata !20, i32 40} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 106, i32 1, metadata !182, null}
!184 = metadata !{i32 104, i32 93, metadata !180, null}
!185 = metadata !{i32 110, i32 1, metadata !44, null}
!186 = metadata !{i32 144, i32 1, metadata !187, null}
!187 = metadata !{i32 720907, metadata !44, i32 110, i32 1, metadata !20, i32 41} ; [ DW_TAG_lexical_block ]
!188 = metadata !{i32 145, i32 1, metadata !189, null}
!189 = metadata !{i32 720907, metadata !187, i32 144, i32 1, metadata !20, i32 42} ; [ DW_TAG_lexical_block ]
!190 = metadata !{i32 146, i32 6, metadata !191, null}
!191 = metadata !{i32 720907, metadata !189, i32 145, i32 1, metadata !20, i32 43} ; [ DW_TAG_lexical_block ]
!192 = metadata !{i32 146, i32 1, metadata !193, null}
!193 = metadata !{i32 720907, metadata !191, i32 146, i32 1, metadata !20, i32 44} ; [ DW_TAG_lexical_block ]
!194 = metadata !{i32 147, i32 6, metadata !195, null}
!195 = metadata !{i32 720907, metadata !196, i32 146, i32 1, metadata !20, i32 46} ; [ DW_TAG_lexical_block ]
!196 = metadata !{i32 720907, metadata !193, i32 146, i32 1, metadata !20, i32 45} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 721152, metadata !44, metadata !"j", metadata !20, i32 76, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!198 = metadata !{i32 147, i32 1, metadata !199, null}
!199 = metadata !{i32 720907, metadata !195, i32 147, i32 1, metadata !20, i32 47} ; [ DW_TAG_lexical_block ]
!200 = metadata !{i32 148, i32 1, metadata !201, null}
!201 = metadata !{i32 720907, metadata !199, i32 147, i32 1, metadata !20, i32 48} ; [ DW_TAG_lexical_block ]
!202 = metadata !{i32 147, i32 127, metadata !199, null}
!203 = metadata !{i32 146, i32 93, metadata !193, null}
!204 = metadata !{i32 151, i32 1, metadata !205, null}
!205 = metadata !{i32 720907, metadata !187, i32 150, i32 1, metadata !20, i32 49} ; [ DW_TAG_lexical_block ]
!206 = metadata !{i32 152, i32 6, metadata !207, null}
!207 = metadata !{i32 720907, metadata !205, i32 151, i32 1, metadata !20, i32 50} ; [ DW_TAG_lexical_block ]
!208 = metadata !{i32 152, i32 1, metadata !209, null}
!209 = metadata !{i32 720907, metadata !207, i32 152, i32 1, metadata !20, i32 51} ; [ DW_TAG_lexical_block ]
!210 = metadata !{i32 153, i32 6, metadata !211, null}
!211 = metadata !{i32 720907, metadata !212, i32 152, i32 1, metadata !20, i32 53} ; [ DW_TAG_lexical_block ]
!212 = metadata !{i32 720907, metadata !209, i32 152, i32 1, metadata !20, i32 52} ; [ DW_TAG_lexical_block ]
!213 = metadata !{i32 153, i32 1, metadata !214, null}
!214 = metadata !{i32 720907, metadata !211, i32 153, i32 1, metadata !20, i32 54} ; [ DW_TAG_lexical_block ]
!215 = metadata !{i32 154, i32 1, metadata !216, null}
!216 = metadata !{i32 720907, metadata !214, i32 153, i32 1, metadata !20, i32 55} ; [ DW_TAG_lexical_block ]
!217 = metadata !{i32 153, i32 127, metadata !214, null}
!218 = metadata !{i32 155, i32 1, metadata !212, null}
!219 = metadata !{i32 721153, metadata !14, metadata !"a", metadata !15, i32 4512, metadata !18, i32 0, metadata !220} ; [ DW_TAG_arg_variable ]
!220 = metadata !{i32 155, i32 160, metadata !212, null}
!221 = metadata !{i32 4512, i32 71, metadata !14, metadata !220}
!222 = metadata !{i32 721153, metadata !14, metadata !"b", metadata !15, i32 4512, metadata !18, i32 0, metadata !220} ; [ DW_TAG_arg_variable ]
!223 = metadata !{i32 4512, i32 80, metadata !14, metadata !220}
!224 = metadata !{i32 4515, i32 10, metadata !111, metadata !220}
!225 = metadata !{i32 152, i32 93, metadata !209, null}
!226 = metadata !{i32 159, i32 1, metadata !44, null}
!227 = metadata !{i32 161, i32 1, metadata !228, null}
!228 = metadata !{i32 720907, metadata !44, i32 159, i32 1, metadata !20, i32 56} ; [ DW_TAG_lexical_block ]
!229 = metadata !{i32 162, i32 1, metadata !230, null}
!230 = metadata !{i32 720907, metadata !228, i32 161, i32 1, metadata !20, i32 57} ; [ DW_TAG_lexical_block ]
!231 = metadata !{i32 163, i32 1, metadata !230, null}
!232 = metadata !{i32 164, i32 6, metadata !233, null}
!233 = metadata !{i32 720907, metadata !230, i32 163, i32 1, metadata !20, i32 58} ; [ DW_TAG_lexical_block ]
!234 = metadata !{i32 164, i32 1, metadata !235, null}
!235 = metadata !{i32 720907, metadata !233, i32 164, i32 1, metadata !20, i32 59} ; [ DW_TAG_lexical_block ]
!236 = metadata !{i32 165, i32 1, metadata !237, null}
!237 = metadata !{i32 720907, metadata !235, i32 164, i32 1, metadata !20, i32 60} ; [ DW_TAG_lexical_block ]
!238 = metadata !{i32 166, i32 1, metadata !237, null}
!239 = metadata !{i32 164, i32 93, metadata !235, null}
!240 = metadata !{i32 169, i32 1, metadata !241, null}
!241 = metadata !{i32 720907, metadata !228, i32 168, i32 1, metadata !20, i32 61} ; [ DW_TAG_lexical_block ]
!242 = metadata !{i32 170, i32 1, metadata !241, null}
!243 = metadata !{i32 171, i32 6, metadata !244, null}
!244 = metadata !{i32 720907, metadata !241, i32 170, i32 1, metadata !20, i32 62} ; [ DW_TAG_lexical_block ]
!245 = metadata !{i32 171, i32 1, metadata !246, null}
!246 = metadata !{i32 720907, metadata !244, i32 171, i32 1, metadata !20, i32 63} ; [ DW_TAG_lexical_block ]
!247 = metadata !{i32 172, i32 1, metadata !248, null}
!248 = metadata !{i32 720907, metadata !246, i32 171, i32 1, metadata !20, i32 64} ; [ DW_TAG_lexical_block ]
!249 = metadata !{i32 173, i32 1, metadata !248, null}
!250 = metadata !{i32 171, i32 93, metadata !246, null}
!251 = metadata !{i32 177, i32 2, metadata !46, null}
!252 = metadata !{i32 721153, metadata !27, metadata !"m", metadata !20, i32 180, metadata !24, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!253 = metadata !{i32 180, i32 8, metadata !27, null}
!254 = metadata !{i32 721153, metadata !27, metadata !"matrix_dim", metadata !20, i32 180, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!255 = metadata !{i32 180, i32 5, metadata !27, null}
!256 = metadata !{i32 721153, metadata !27, metadata !"offset", metadata !20, i32 180, metadata !25, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!257 = metadata !{i32 188, i32 1, metadata !50, null}
!258 = metadata !{i32 721152, metadata !50, metadata !"global_row_id", metadata !20, i32 188, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!259 = metadata !{i32 189, i32 1, metadata !50, null}
!260 = metadata !{i32 721152, metadata !50, metadata !"global_col_id", metadata !20, i32 189, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!261 = metadata !{i32 191, i32 1, metadata !50, null}
!262 = metadata !{i32 192, i32 1, metadata !50, null}
!263 = metadata !{i32 194, i32 1, metadata !50, null}
!264 = metadata !{i32 196, i32 1, metadata !50, null}
!265 = metadata !{i32 721152, metadata !50, metadata !"sum", metadata !20, i32 186, metadata !18, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!266 = metadata !{i32 197, i32 6, metadata !267, null}
!267 = metadata !{i32 720907, metadata !50, i32 196, i32 1, metadata !20, i32 68} ; [ DW_TAG_lexical_block ]
!268 = metadata !{i32 721152, metadata !50, metadata !"i", metadata !20, i32 185, metadata !25, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!269 = metadata !{i32 197, i32 1, metadata !270, null}
!270 = metadata !{i32 720907, metadata !267, i32 197, i32 1, metadata !20, i32 69} ; [ DW_TAG_lexical_block ]
!271 = metadata !{i32 198, i32 1, metadata !272, null}
!272 = metadata !{i32 720907, metadata !270, i32 197, i32 1, metadata !20, i32 70} ; [ DW_TAG_lexical_block ]
!273 = metadata !{i32 197, i32 93, metadata !270, null}
!274 = metadata !{i32 199, i32 1, metadata !50, null}
!275 = metadata !{i32 202, i32 2, metadata !52, null}
