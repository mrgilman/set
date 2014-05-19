class @Game
  start: ->
    canvas = document.getElementById('set')
    ctx = canvas.getContext('2d')

    for i in [0..2]
      for j in [0..3]
        ctx.strokeRect(300 * j + 50, 300 * i + 50, 180, 220)
