float baseH = 60;
float basew = 10;
float armL1 = 50;
float armL2 = 40;
float nailL = 15;
float armW1 = 9;
float armW2 = 8;
float nailw = 2;
float angle0 = 0;
float angle1 = 0;
float dif0 = 0.8;
float dif1 = 0.8;
float dif2 = 1.2;
float dif3 = 0.4;
float dif4 = 5.5;

void setup(){
  size(1200, 800, P3D);
 
  camera(100, 180, 100, 0, 0, 0, 0, 0, -1);
  
  noStroke();  
}

void draw(){
  
  background(255);
  if(keyPressed){
    
    //全体を回転
    if(key == 'a'){
      angle0 = angle0 + dif0;
    }
    if(key == 'A'){
      angle0 = angle0 - dif0;
    }
    
   
    
    
    //アームの回転
    if(key == 'b'){
      if(angle1 <= 0&&angle1 >= -150 ){
      angle1 =(angle1 - dif2);}
      else if(angle1 < -150&&angle1 >= -270 ){
      angle1 =(angle1 - dif4);}
      else{
      angle1 = angle1;} 
    }
    if(key == 'B'){
      if(angle1 <= -1.2 ){
      angle1 = angle1 + dif2;
      }
    }
    
    
    //初期位置に戻す
    if (key == 'c'){
      if(angle0 >=0 ){
        angle0 = angle0 - dif3;
        }else{
        angle0 = angle0 + dif3;
        } 
      if(angle1 >=-0.4 ){
        angle1 = angle1 - dif3;
        }else{
        angle1 = angle1 + dif3;
        }       
    }
  }
   //台座
    translate(0,0,-baseH);
    fill(0);
     box(3*basew,3*basew,-baseH/8);
     
  //1つ目のリンク
  rotateZ(radians(angle0));
  translate(0,0,baseH/2);
  fill(50,200,100);
  box(basew,basew,baseH);
  
  //2つ目のリンク
  //1つ目のジョイントへ
  translate(0,0,baseH/2-armW1/2);
  //ジョイントの中央へ
  translate(0,armL1/2-basew/2,-0.5);
  fill(50,200,100);
  box(armW1,armL1,armW1);
  
  //3つ目のリンク
  //2つ目のジョイントへ
  translate(0,armL1/2+basew/2-armW2,0);
  rotateY(radians(-angle1));
  //ジョイントの中央へ
  translate(0,0,-armL2/2+basew/2);
  fill(50,200,100);
  box(armW2,armW2,-armL2);
  
  //爪
  //ジョイントへ
  translate(3,0,-armL2/2-nailL/2);
  fill(0);
  box(nailw,nailw,nailL);
}
