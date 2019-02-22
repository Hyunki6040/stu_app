package poly.service;

import java.util.List;

import poly.dto.BoardDTO;
import poly.dto.CommentDTO;

public interface ICommentService {
	public List<CommentDTO> CommentsList() throws Exception;
	public List<CommentDTO> CampusCommentsList(BoardDTO mDTO) throws Exception;
	public int insert(CommentDTO cDTO) throws Exception;
	
	public CommentDTO getComment(int cno) throws Exception;
	public int updateLikedComment(CommentDTO bDTO) throws Exception;
	public int updateHatredComment(CommentDTO bDTO) throws Exception;
	
	public int delete(CommentDTO bDTO) throws Exception;
}
