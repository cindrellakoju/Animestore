document.addEventListener('DOMContentLoaded', function() {
    // Get DOM elements
    let nextDom = document.getElementById('next');
    let prevDom = document.getElementById('prev');
    let carouselDom = document.querySelector('.carousel');
    let SliderDom = carouselDom.querySelector('.carousel .list');
    let thumbnailBorderDom = document.querySelector('.carousel .thumbnail');
    let thumbnailItemsDom = thumbnailBorderDom.querySelectorAll('.item');
    let timeDom = document.querySelector('.carousel .time');

    // Append first thumbnail item to the end
    thumbnailBorderDom.appendChild(thumbnailItemsDom[0]);

    // Define time intervals
    let timeRunning = 3000;
    let timeAutoNext = 7000;

    // Define click event handlers for next and previous buttons
    nextDom.onclick = function(){
        showSlider('next');    
    }

    prevDom.onclick = function(){
        showSlider('prev');    
    }
    let runTimeOut;
    // Run auto slide after a delay
    let runNextAuto = setTimeout(() => {
        next.click();
    }, timeAutoNext)

    // Function to show slider based on direction
    function showSlider(type){
        let  SliderItemsDom = SliderDom.querySelectorAll('.carousel .list .item');
        let thumbnailItemsDom = document.querySelectorAll('.carousel .thumbnail .item');
        
        if(type === 'next'){
            SliderDom.appendChild(SliderItemsDom[0]);
            thumbnailBorderDom.appendChild(thumbnailItemsDom[0]);
            carouselDom.classList.add('next');
        }else{
            SliderDom.prepend(SliderItemsDom[SliderItemsDom.length - 1]);
            thumbnailBorderDom.prepend(thumbnailItemsDom[thumbnailItemsDom.length - 1]);
            carouselDom.classList.add('prev');
        }
        
        // Clear timeout and reset classes after animation
        clearTimeout(runTimeOut);
        runTimeOut = setTimeout(() => {
            carouselDom.classList.remove('next');
            carouselDom.classList.remove('prev');
        }, timeRunning);

        // Reset auto slide timeout
        clearTimeout(runNextAuto);
        runNextAuto = setTimeout(() => {
            next.click();
        }, timeAutoNext)
    }
});
