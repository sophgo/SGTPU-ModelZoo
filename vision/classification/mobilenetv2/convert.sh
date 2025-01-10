model_transform.py \
   --model_name mobilenet_v2 \
   --model_def mobilenetv2-7.onnx \
   --input_shapes [[1,3,224,224]] \
   --mean 123.675,116.28,103.53 \
   --scale 0.0171,0.0175,0.0174 \
   --pixel_format rgb \
   --test_input cat.jpg \
   --test_result mobilenet_v2_top_output.npz \
   --mlir mobilenet_v2.mlir

run_calibration.py mobilenet_v2.mlir \
  --dataset ILSVRC2012 \
  --input_num 100 \
  -o mobilenet_v2_cali_table

model_deploy.py \
  --quantize int8 \
  --mlir mobilenet_v2.mlir \
  --chip bm1684x \
  --tolerance 0.95,0.69 \
  --debug \
  --test_input mobilenet_v2_in_f32.npz \
  --calibration_table mobilenet_v2_cali_table \
  --test_reference mobilenet_v2_top_output.npz \
  --model mobilenet_v2_int8.bmodel


