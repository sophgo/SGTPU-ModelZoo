

model_transform.py \
   --model_name yolov5s \
   --model_def yolov5s.onnx \
   --input_shapes [[1,3,640,640]] \
   --mean 0.0,0.0,0.0 \
   --scale 0.0039216,0.0039216,0.0039216 \
   --pixel_format rgb \
   --output_names 326,474,622 \
   --test_input dog.jpg \
   --test_result yolov5s_top_output.npz \
   --mlir yolov5s.mlir

run_calibration.py yolov5s.mlir \
  --dataset COCO2017 \
  --input_num 100 \
  -o yolov5s_cali_table

model_deploy.py \
  --quantize int8 \
  --mlir yolov5s.mlir \
  --chip bm1684x \
  --tolerance 0.92,0.61 \
  --debug \
  --test_input yolov5s_in_f32.npz \
  --calibration_table yolov5s_cali_table \
  --test_reference yolov5s_top_output.npz \
  --model yolov5s_int8.bmodel


