package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BoardDTO;
import poly.dto.CommentDTO;
import poly.persistance.mapper.CommentMapper;
import poly.service.ICommentService;

@Service("CommentService")
public class CommentService implements ICommentService {

	@Resource(name = "CommentMapper")
	private CommentMapper commentMapper;
	
	@Override
	public List<CommentDTO> CommentsList() throws Exception {
		List<CommentDTO> list = null;
		list = commentMapper.CommentsList();
		return list;
	}
	
	@Override
	public List<CommentDTO> CampusCommentsList(BoardDTO mDTO) throws Exception {
		List<CommentDTO> list = null;
		list = commentMapper.CampusCommentsList(mDTO);
		return list;
	}
	
	@Override
	public int insert(CommentDTO cDTO) throws Exception {
		return commentMapper.insert(cDTO);
	}
	
	@Override
	public CommentDTO getComment(int cno) throws Exception{
		return commentMapper.getComment(cno);
	}
	
	@Override
	public int updateLikedComment(CommentDTO bDTO) throws Exception{
		return commentMapper.updateLikedComment(bDTO);
	}
	
	@Override
	public int updateHatredComment(CommentDTO bDTO) throws Exception{
		return commentMapper.updateHatredComment(bDTO);
	}
	
	@Override
	public int delete(CommentDTO bDTO) throws Exception{
		return commentMapper.CommentDelete(bDTO);
	}

}
