

model_transform.py \
   --model_name resnet50-v2-7 \
   --model_def resnet50-v2-7.onnx \
   --input_shapes [[1,3,224,224]] \
   --mean 123.675,116.28,103.53 \
   --scale 0.0171,0.0175,0.0174 \
   --pixel_format rgb \
   --test_input cat.jpg \
   --test_result resnet50-v2-7_top_output.npz \
   --mlir resnet50-v2-7.mlir


run_calibration.py resnet50-v2-7.mlir \
  --dataset ILSVRC2012 \
  --input_num 100 \
  -o resnet50-v2-7_cali_table

model_deploy.py \
  --quantize int8 \
  --mlir resnet50-v2-7.mlir \
  --chip sgtpuv8 \
  --tolerance 0.92,0.60 \
  --compress_mode "all" \
  --debug \
  --test_input resnet50-v2-7_in_f32.npz \
  --calibration_table resnet50-v2-7_cali_table \
  --test_reference resnet50-v2-7_top_output.npz \
  --model resnet50-v2-7_int8.bmodel


