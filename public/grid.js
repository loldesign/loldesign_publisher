var Grid = function(){
  var button_grid =  Grid.elements().button_grid.on('click', Grid.toggle);
  var grid_container = Grid.elements().grid_container.append(Grid.elements().grid_element);

  $('body').prepend(button_grid);
  $('body').prepend(grid_container);
}

Grid.elements = function(){
  var grid_container = $('<div>', {
    id: 'grid_container'
  }).css({
    marginLeft: 'auto',
    marginRight: 'auto',
    width: '1056px'
  });

  var grid_element = $('<div>', {
    id: 'grid_back'
  }).css({
    display: 'none',
    position: 'absolute',
    background: 'url("/assets/grid.png") repeat-y scroll 0 0 transparent',
    height: '3000px',
    opacity: 0.5,
    width: 'inherit',
    zIndex: 1000,
    top: '1px'
  });

  var button_grid = $('<a>', {
    id: 'grid_on_off',
    text: '#',
    href: "#"
  }).css({
    position: 'absolute',
    color: '#333',
    fontSize: '13px',
    top: '0px',
    right: '20px',
    zIndex: 2000
  });

  return {
    grid_container: grid_container,
    grid_element: grid_element,
    button_grid: button_grid
  }
}

Grid.toggle = function(event){
  event.preventDefault();
  $('#grid_back').toggle();
}

// $(document).ready(function(){
//   Grid();
// });

// $(document).ready(function(){
//    $('#contact a').last().click(function(){
//     $(this).parent().hide();
//    })

//    $(document).keydown(function(e) {
//       if (e.keyCode == 27) { Grid.toggle(e) }
//   })
// });
