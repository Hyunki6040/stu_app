package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.persistance.mapper.BoardMapper;
import poly.service.IBoardService;

@Service("BoardService")
public class BoardService implements IBoardService {

	@Resource(name = "BoardMapper")
	private BoardMapper boardMapper;
	
	@Override
	public int create(BoardDTO bDTO) throws Exception {
		return boardMapper.create(bDTO);
	}
	
	@Override
	public int Univcreate(BoardDTO bDTO) throws Exception {
		return boardMapper.Univcreate(bDTO);
	}
	
	@Override
	public List<BoardDTO> CampusList(BoardDTO mDTO) throws Exception {
		List<BoardDTO> list = null;
		list = boardMapper.CampusList(mDTO);
		return list;
	}
	
	@Override
	public List<BoardDTO> UnivList() throws Exception {
		List<BoardDTO> list = null;
		list = boardMapper.UnivList();
		return list;
	}
	
	@Override
	public List<BoardDTO> CampusBestList(BoardDTO mDTO) throws Exception {
		List<BoardDTO> list = null;
		list = boardMapper.CampusList(mDTO);
		return list;
	}
	
	
	@Override
	public List<BoardDTO> UnivBestList() throws Exception {
		List<BoardDTO> list = null;
		list = boardMapper.UnivList();
		return list;
	}
	
	@Override
	public BoardDTO getBoard(int bno) throws Exception{
		return boardMapper.getBoard(bno);
	}
	
	@Override
	public int updateLikedBoard(BoardDTO bDTO) throws Exception{
		return boardMapper.updateLikedBoard(bDTO);
	}
	
	@Override
	public int updateHatredBoard(BoardDTO bDTO) throws Exception{
		return boardMapper.updateHatredBoard(bDTO);
	}
	
	@Override
	public int delete(BoardDTO bDTO) throws Exception{
		return boardMapper.delete(bDTO);
	}
	
	@Override
	public int Commentdelete(String bno) throws Exception{
		return boardMapper.Commentdelete(bno);
	}

}
