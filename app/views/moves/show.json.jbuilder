# frozen_string_literal: true

json.partial! 'moves/move', move: @move
json.results @results if @results
json.roll @roll if @roll
