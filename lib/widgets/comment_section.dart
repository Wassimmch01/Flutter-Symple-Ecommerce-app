import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/product.dart';

class CommentSection extends StatefulWidget {
  final Product product;

  const CommentSection({super.key, required this.product});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final _controller = TextEditingController();
  double _rating = 3;

  void _submitComment() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      widget.product.comments.add(
        Comment(
          userName: "Utilisateur",
          text: _controller.text,
          rating: _rating,
        ),
      );
      _controller.clear();
      _rating = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final comments = widget.product.comments;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Commentaires",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          for (var comment in comments)
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black54),
              title: Text(
                comment.userName,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.text, style: GoogleFonts.poppins(fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      5,
                      (i) => Icon(
                        Icons.star,
                        size: 18,
                        color: i < comment.rating ? Colors.amber : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const Divider(),
          const SizedBox(height: 8),
          Text(
            "Ajouter un commentaire",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),

          TextField(
            controller: _controller,
            maxLines: 5,
            style: GoogleFonts.poppins(),
            decoration: InputDecoration(
              labelText: "Votre avis",
              labelStyle: GoogleFonts.poppins(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.blue,
                ), // Bordure normale en bleu
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ), // Bordure active en bleu plus épais
              ),
            ),
          ),

          const SizedBox(height: 12),
          Text("Note :", style: GoogleFonts.poppins(fontSize: 16)),
          const SizedBox(height: 4),
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemSize: 30,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder:
                (context, _) => const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) => setState(() => _rating = rating),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: _submitComment,
              icon: const Icon(Icons.check, color: Colors.white),
              label: Text(
                "Envoyer",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
