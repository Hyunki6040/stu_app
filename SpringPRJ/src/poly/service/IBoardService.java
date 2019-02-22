package poly.service;

import java.util.List;

import poly.dto.BoardDTO;


public interface IBoardService {
	public int create(BoardDTO bDTO) throws Exception;
	public int Univcreate(BoardDTO bDTO) throws Exception;
	public List<BoardDTO> CampusList(BoardDTO mDTO) throws Exception;
	public List<BoardDTO> UnivList() throws Exception;
	public List<BoardDTO> CampusBestList(BoardDTO mDTO) throws Exception;
	public List<BoardDTO> UnivBestList() throws Exception;
	public BoardDTO getBoard(int bno) throws Exception;
	public int updateLikedBoard(BoardDTO bDTO) throws Exception;
	public int updateHatredBoard(BoardDTO bDTO) throws Exception;
	
	public int delete(BoardDTO bDTO) throws Exception;
	public int Commentdelete(String bno) throws Exception;
}
