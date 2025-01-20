

model_transform.py \
   --model_name squeezenet_v1.1 \
   --model_def squeezenet_ssh_deploy.prototxt \
   --model_data squeezenet_21k.caffemodel \
   --input_shapes [[1,3,400,711]] \
   --resize_dims 400,711 \
   --mean 128,128,128 \
   --scale 0.0078125,0.0078125,0.0078125  \
   --pixel_format bgr \
   --test_input cat.jpg \
   --test_result squeezenet_v1.1_top_output.npz \
   --mlir squeezenet_v1.1.mlir


run_calibration.py squeezenet_v1.1.mlir \
  --dataset ILSVRC2012 \
  --input_num 100 \
  -o squeezenet_v1.1_cali_table

model_deploy.py \
  --quantize int8 \
  --mlir squeezenet_v1.1.mlir \
  --chip sgtpuv8 \
  --tolerance 0.90,0.70 \
  --debug \
  --test_input squeezenet_v1.1_in_f32.npz \
  --calibration_table squeezenet_v1.1_cali_table \
  --test_reference squeezenet_v1.1_top_output.npz \
  --model squeezenet_v1.1_int8.bmodel

