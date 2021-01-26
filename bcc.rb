# Bingo Card

require "prawn"

def space(num)
  if num < 10
    "  #{num}"
  else
    " #{num}"
  end
end

b_col = (1..15).to_a.sample(5)
i_col = (16..30).to_a.sample(5)
n_col = (31..45).to_a.sample(4)
g_col = (46..60).to_a.sample(5)
o_col = (61..75).to_a.sample(5)

bingo_card = <<-BINGO
+-----+-----+-----+-----+-----+
|  B  |  I  |  N  |  G  |  O  |
+-----+-----+-----+-----+-----+
| #{space(b_col[0])} | #{space(i_col[0])} | #{space(n_col[0])} | #{space(g_col[0])} | #{space(o_col[0])} |
+-----+-----+-----+-----+-----+
| #{space(b_col[1])} | #{space(i_col[1])} | #{space(n_col[1])} | #{space(g_col[1])} | #{space(o_col[1])} |
+-----+-----+-----+-----+-----+
| #{space(b_col[2])} | #{space(i_col[2])} |  F  | #{space(g_col[2])} | #{space(o_col[2])} |
+-----+-----+-----+-----+-----+
| #{space(b_col[3])} | #{space(i_col[3])} | #{space(n_col[2])} | #{space(g_col[3])} | #{space(o_col[3])} |
+-----+-----+-----+-----+-----+
| #{space(b_col[4])} | #{space(i_col[4])} | #{space(n_col[3])} | #{space(g_col[4])} | #{space(o_col[4])} |
+-----+-----+-----+-----+-----+
BINGO

puts bingo_card

# puts b_col.inspect
# puts i_col.inspect
# puts n_col.inspect
# puts g_col.inspect
# puts o_col.inspect

header = ["B", "I", "N", "G", "O"]
n_col.insert(2, "F")

Prawn::Document.generate("bingo.pdf") do
    define_grid(columns: 5, rows: 6)

header.each_with_index do |char, i|
      grid(0, i).bounding_box do
      stroke_bounds
      text char, align: :center, valign: :center, size: 50, style: :bold
    end
  end

b_col.each_with_index do |num, i|
      grid((i + 1), 0).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size:50
    end
  end

i_col.each_with_index do |num, i|
      grid((i + 1), 1).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size:50
    end
  end

n_col.each_with_index do |num, i|
      grid((i + 1), 2).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size:50
    end
  end

g_col.each_with_index do |num, i|
      grid((i + 1), 3).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size:50
    end
  end

o_col.each_with_index do |num, i|
      grid((i + 1), 4).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size:50
    end
  end

end
