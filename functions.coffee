$ ->
  vertical = Math.round(Math.random())
  ship5 = []
  ship4 = []
  ship3 = []
  tries = 25
  gameover = false
  ship5sunk = false
  ship4sunk = false
  ship3sunk = false
  ship5hits = 0
  ship4hits = 0
  ship3hits = 0
  num1 = (Math.floor((Math.random() * 7) + 1))
  num2 = (Math.floor((Math.random() * 3) + 1)).toString()
  if vertical == 1
    start = parseInt(num2+num1)
    ship5 = [start, start+10, start+20, start+30, start+40]
  else 
    start = parseInt(num1+num2)
    ship5 = [start, start+1, start+2, start+3, start+4]
  console.log(ship5)
  ship4set = false
  while(ship4set == false)
      vertical = Math.round(Math.random())
      num1 = (Math.floor((Math.random() * 7) + 1))
      num2 = (Math.floor((Math.random() * 4) + 1)).toString()
      if vertical == 1
        start = parseInt(num2+num1)
        ship4 = [start, start+10, start+20, start+30]
      else 
        start = parseInt(num1+num2)
        ship4 = [start, start+1, start+2, start+3]
      
        
        for i in ship4
             res = jQuery.inArray(i, ship5)
             if res == -1
                 ship4set = true
             else
                 ship4set = false
                 console.log("ship4 set attempt fail")
                 break;
            
             
  console.log(ship4)
  
      
      
  ship3set = false
  while(ship3set == false)
      vertical = Math.round(Math.random())
      num1 = (Math.floor((Math.random() * 7) + 1))
      num2 = (Math.floor((Math.random() * 5) + 1)).toString()
      if vertical == 1
        start = parseInt(num2+num1)
        ship3 = [start, start+10, start+20]
      else 
        start = parseInt(num1+num2)
        ship3 = [start, start+1, start+2]
      for i in ship3
             res = jQuery.inArray(i, ship5)
             if res == -1
                 ship3set = true
             else
                 ship3set = false
                 console.log("ship3 set failure")
                 break;
             res = jQuery.inArray(i, ship4)
             if res == -1
                 ship3set = true
             else
                 ship3set = false
                 console.log("ship3 set attempt fail")
                 break;
             
  console.log(ship3)             
                 
  
  
  $(".block").click ->
    if tries > 0 && gameover == false
        tries = tries - 1
        $("#tries").html(tries);
        console.log("tries:" + tries)
        
        Id = parseInt(event.target.id)
        hit5 = jQuery.inArray(Id, ship5)
        if hit5 == -1
          
          hit4 = jQuery.inArray(Id, ship4)
          if hit4 == -1
             
             
             hit3 = jQuery.inArray(Id, ship3)
             if hit3 == -1
               $(this).css('opacity', '.5');
               if tries > 0
                 $("#message").html("Miss");
               else
                  $("#message").html("Failure");
                  $(".block").css('cursor', 'default');
                  gameover = true
             else
              console.log("hit3")
              ship3hits += 1
              $("#message").html("HIT!");
              $(this).css('background-size', 'cover');
              $(this).css('opacity', '1');
              $(this).css('background-color', '#0F082E');
             
                 
             
          else
              console.log("hit4")
              ship4hits += 1
              $("#message").html("HIT!");
              $(this).css('background-size', 'cover');
              $(this).css('opacity', '1');
              $(this).css('background-color', '#0F082E');
        else
          console.log("hit5")
          $(this).css('background-size', 'cover');
          $(this).css('opacity', '1');
          $(this).css('background-color', '#0F082E');
          $("#message").html("HIT!");
          ship5hits += 1
        if ship5hits == 5
            ship5sunk = true
            $( "#sunk" ).append( "<p>Large Ship</p>" );
            ship5hits = 10
        if ship4hits == 4
            ship4sunk = true
            $( "#sunk" ).append( "<p>Medium Ship</p>" );
            ship4hits = 10
        if ship3hits == 3
            ship3sunk = true
            $( "#sunk" ).append( "<p>Small Ship</p>" );
            ship3hits = 10
        if ship5sunk == true && ship4sunk == true && ship3sunk == true
            $("#message").html("Victory!");
            $(".block").css('cursor', 'default');
            gameover = true
            
    if tries == 0 
      if ship5sunk == false || ship4sunk == false || ship3sunk == false
          $("#message").html("Failure!");
          gameover = true
          $(".block").css('cursor', 'default');
          
  $("#restart").click ->
      location.reload();
      