gpu_id=1
data_root=../parisStreetView/val/paris_eval_gt
#model_prefix=checkpoints/paris_fcgan_wfeat50
#model_prefix=checkpoints/paris_fcgan_wfeat0
model_prefix=checkpoints/paris_fcgan_res_unet_wfeat50
i=400
while [ "$i" -le 1000 ]
do
	model=${model_prefix}_${i}_net_G.t7
	echo $model
	test_script=test_fcgan.lua
	CUDA_VISIBLE_DEVICES=${gpu_id} DATA_ROOT=${data_root} netG=${model} th ${test_script}
	i=$(($i+20))
done
