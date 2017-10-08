require_relative '../sudoku'

describe "Sudoku" do
  before(:each) do
    simple_board_1 = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
    simple_board_2 = "--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3"
    simple_board_3 = "29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9"
    simple_board_4 = "-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-"
    simple_board_5 = "6-873----2-----46-----6482--8---57-19--618--4-31----8-86-2---39-5----1--1--4562--"

    advanced_board_1 = "---6891--8------2915------84-3----5-2----5----9-24-8-1-847--91-5------6--6-41----"
    advanced_board_2 = "-3-5--8-45-42---1---8--9---79-8-61-3-----54---5------78-----7-2---7-46--61-3--5--"
    advanced_board_3 = "-96-4---11---6---45-481-39---795--43-3--8----4-5-23-18-1-63--59-59-7-83---359---7"
    advanced_board_4 = "----754----------8-8-19----3----1-6--------34----6817-2-4---6-39------2-53-2-----"
    advanced_board_5 = "3---------5-7-3--8----28-7-7------43-----------39-41-54--3--8--1---4----968---2--"

    hard_board_1 = "3-26-9--55--73----------9-----94----------1-9----57-6---85----6--------3-19-82-4-"
    hard_board_2 = "-2-5----48-5--------48-9-2------5-73-9-----6-25-9------3-6-18--------4-71----4-9-"
    hard_board_3 = "--7--8------2---6-65--79----7----3-5-83---67-2-1----8----71--38-2---5------4--2--"
    hard_board_4 = "----------2-65-------18--4--9----6-4-3---57-------------------73------9----------"
    hard_board_5 = "---------------------------------------------------------------------------------"
  end

  context "when solve(board) function runs" do
    it "solves the simple_board_1 successfuly" do
      solve(simple_board_1)
      expect(solved?(simple_board_1)).to eq(true)
    end
    it "solves the simple_board_2 successfuly" do
      solve(simple_board_2)
      expect(solved?(simple_board_2)).to eq(true)
    end
    it "solves the simple_board_3 successfuly" do
      solve(simple_board_3)
      expect(solved?(simple_board_3)).to eq(true)
    end
    it "solves the simple_board_4 successfuly" do
      solve(simple_board_4)
      expect(solved?(simple_board_4)).to eq(true)
    end
    it "solves the simple_board_5 successfuly" do
      solve(simple_board_5)
      expect(solved?(simple_board_5)).to eq(true)
    end
    it "solves the advanced_board_1 successfuly" do
      solve(advanced_board_1)
      expect(solved?(advanced_board_1)).to eq(true)
    end
    it "solves the advanced_board_2 successfuly" do
      solve(advanced_board_2)
      expect(solved?(advanced_board_2)).to eq(true)
    end
    it "solves the advanced_board_3 successfuly" do
      solve(advanced_board_3)
      expect(solved?(advanced_board_3)).to eq(true)
    end
    it "solves the advanced_board_4 successfuly" do
      solve(advanced_board_4)
      expect(solved?(advanced_board_4)).to eq(true)
    end
    it "solves the advanced_board_5 successfuly" do
      solve(advanced_board_5)
      expect(solved?(advanced_board_5)).to eq(true)
    end
    it "solves the hard_board_1 successfuly" do
      solve(hard_board_1)
      expect(solved?(hard_board_1)).to eq(true)
    end
    it "solves the hard_board_2 successfuly" do
      solve(hard_board_2)
      expect(solved?(hard_board_2)).to eq(true)
    end
    it "solves the hard_board_3 successfuly" do
      solve(hard_board_3)
      expect(solved?(hard_board_3)).to eq(true)
    end
    it "solves the hard_board_4 successfuly" do
      solve(hard_board_4)
      expect(solved?(hard_board_4)).to eq(true)
    end
    it "solves the hard_board_5 successfuly" do
      solve(hard_board_5)
      expect(solved?(hard_board_5)).to eq(true)
    end
  end

  context "when solve_with_basic_logic(board) function runs" do
    it "solves the simple_board_1 successfuly" do
      solve(simple_board_1)
      expect(solved?(simple_board_1)).to eq(true)
    end
    it "solves the simple_board_2 successfuly" do
      solve(simple_board_2)
      expect(solved?(simple_board_2)).to eq(true)
    end
    it "solves the simple_board_3 successfuly" do
      solve(simple_board_3)
      expect(solved?(simple_board_3)).to eq(true)
    end
    it "solves the simple_board_4 successfuly" do
      solve(simple_board_4)
      expect(solved?(simple_board_4)).to eq(true)
    end
    it "solves the simple_board_5 successfuly" do
      solve(simple_board_5)
      expect(solved?(simple_board_5)).to eq(true)
    end
  end

  context "when solve_with_advanced_logic(board) function runs" do
    it "solves the advanced_board_1 successfuly" do
      solve(advanced_board_1)
      expect(solved?(advanced_board_1)).to eq(true)
    end
    it "solves the advanced_board_2 successfuly" do
      solve(advanced_board_2)
      expect(solved?(advanced_board_2)).to eq(true)
    end
    it "solves the advanced_board_3 successfuly" do
      solve(advanced_board_3)
      expect(solved?(advanced_board_3)).to eq(true)
    end
    it "solves the advanced_board_4 successfuly" do
      solve(advanced_board_4)
      expect(solved?(advanced_board_4)).to eq(true)
    end
    it "solves the advanced_board_5 successfuly" do
      solve(advanced_board_5)
      expect(solved?(advanced_board_5)).to eq(true)
    end
  end

  context "when guess(board) function runs" do
    it "solves the hard_board_1 successfuly" do
      solve(hard_board_1)
      expect(solved?(hard_board_1)).to eq(true)
    end
    it "solves the hard_board_2 successfuly" do
      solve(hard_board_2)
      expect(solved?(hard_board_2)).to eq(true)
    end
    it "solves the hard_board_3 successfuly" do
      solve(hard_board_3)
      expect(solved?(hard_board_3)).to eq(true)
    end
    it "solves the hard_board_4 successfuly" do
      solve(hard_board_4)
      expect(solved?(hard_board_4)).to eq(true)
    end
    it "solves the hard_board_5 successfuly" do
      solve(hard_board_5)
      expect(solved?(hard_board_5)).to eq(true)
    end
  end

  context "when find_index_with_least_unknown(board) function runs" do
    test_board_1 = "7591824638163475292345697189672583411487362953259-4687582671934493825176671493852"
    it "finds the index that with least number of unknowns" do
      expect(find_index_with_least_unknown(test_board_1)).to eq(49)
    end
  end

  context "when fill_guess(board, index, guess) function runs" do
    test_board_1 = "7591824638163475292345697189672583411487362953259-4687582671934493825176671493852"
    context "when the given index is valid" do
      it "fill the given index with the guessed value successfuly" do
        expect{ fill_the_cell(test_board_1, 49, 1) }.to change{ board[49] }.from("-").to("1")
      end
  end
  end
  context "when remove_guess(board, index, guess) function runs" do
    it "#" do
    end
  end
  end
  context "when try(board, index, option) function runs" do
    it "#" do
    end
  end
  end
  context "when solved?(board) function runs" do
    it "#" do
    end
  end
  end
  context "when solved_in_all_rows(board) function runs" do
    it "#" do
    end
  end
  end
  context "when no_empty_cell_in_rows(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_empty_cell_in_row(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when no_duplicates_in_rows(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_duplicates_in_row(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when solved_in_all_cols(board) function runs" do
    it "#" do
    end
  end
  end
  context "when no_empty_cell_in_cols(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_empty_cell_in_col(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when no_duplicates_in_cols(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_duplicates_in_col(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when solved_in_all_cols(board) function runs" do
    it "#" do
    end
  end
  end
  context "when no_empty_cell_in_cols(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_empty_cell_in_col(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when no_duplicates_in_cols(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_duplicates_in_col(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when solved_in_all_blocks(board) function runs" do
    it "#" do
    end
  end
  end
  context "when no_empty_cell_in_blocks(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_empty_cell_in_block(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when no_duplicates_in_blocks(board) function runs" do
    it "#" do
    end
  end
  end
  context "when find_duplicates_in_block(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when find_available_options_in_all(board, index) function runs" do
    it "#" do
    end
  end
  end
  context "when find_available_options_in_row(board, row_index) function runs" do
    it "#" do
    end
  end
  end
  context "when find_available_options_in_col(board, col_index) function runs" do
    it "#" do
    end
  end
  end
  context "when find_available_options_in_block(board, block_index) function runs" do
    it "#" do
    end
  end
  end
  context "when get_row_indexes(index) function runs" do
    it "#" do
    end
  end
  end
  context "when get_col_indexes(index) function runs" do
    it "#" do
    end
  end
  end
  context "when get_block_indexes(index) function runs" do
    it "#" do
    end
  end
  end
  context "when display(array) function runs" do
    it "#" do
    end
  end
  end
end
