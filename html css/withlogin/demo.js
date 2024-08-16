// alert("Working");
let nextBtn=document.querySelector("#next");
let images=document.querySelectorAll(".list .item img");
let imageindex=0;
// nextBtn.style.backgroundColor="red";
nextBtn.addEventListener("click",function(){
    // alert("Working");
    images[imageindex].style.display='none';
    imageindex++;
    images[imageindex+1].style.display='block';
    
});
