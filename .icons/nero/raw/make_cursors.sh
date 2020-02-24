rm -v ../cursors/*

echo "32 0 5 nero1_1_32x32x8.png" | xcursorgen > ../cursors/xterm
echo "32 0 0 nero3_1_32x32x8.png" | xcursorgen > ../cursors/left_ptr
echo "32 0 0 nero4_1_32x32x8.png" | xcursorgen > ../cursors/left_ptr_watch
echo "32 0 0 nero5_1_32x32x8.png" | xcursorgen > ../cursors/question_arrow
echo "32 0 0 nero6_1_32x32x8.png" | xcursorgen > ../cursors/move
echo "32 0 0 nero7_1_32x32x8.png" | xcursorgen > ../cursors/circle


 cd ../cursors/
ln -s -v xterm text

ln -s -v left_prt default
ln -s -v left_ptr arrow
ln -s -v left_ptr top_left_arrow
ln -s -v left_ptr draft_large
ln -s -v left_ptr draft_small

ln -s -v left_ptr_watch 08e8e1c95fe2fc01f976f1e063a24ccd
ln -s -v left_ptr_watch 3ecb610c1bf2410f44200f48c40d3599 

ln -s -v question_arrow 5c6cd98b3f3ebcb1f9c7f1c204630408
ln -s -v question_arrow d9ce0ab605698f320427677b458ad60b
ln -s -v question_arrow help
ln -s -v question_arrow left_ptr_help

ln -s -v move 4498f0e0c1937ffe01fd06f973665830
ln -s -v move 9081237383d90e509aa00f00170e968f

ln -s -v circle crossed_circle
ln -s -v crossed_circle 03b6e0fcb3499374a867c041f52298f0
ln -s -v crossed_circle not-allowed
cd ../raw
