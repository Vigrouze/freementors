import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {

  const selects = document.querySelectorAll('select.form-select')
  console.log(selects)
  // this.selectTargets.for
  selects.forEach((select)=>{
    $(select).barrating({
      theme: 'css-stars'
    });
  });
};

export { initStarRating };
