import express from 'express';
import pool from '../db.js';

const router = express.Router();

// Obtener los items de la wishlist de un usuario
router.get('/:usuarioID', async (req, res) => {
  const { usuarioID } = req.params;
  try {
    const [rows] = await pool.query('SELECT * FROM wishlist WHERE UsuarioID = ?', [usuarioID]);
    res.json(rows);
  } catch (error) {
    console.error('Error al obtener items de la wishlist:', error);
    res.status(500).json({ message: 'Error al obtener items de la wishlist' });
  }
});

// Agregar un libro a la wishlist
router.post('/', async (req, res) => {
  const { usuarioID, libroID, fechaAgregado, cantidad } = req.body;
  try {
    // Verificar si el libro ya está en la wishlist
    const [existingRows] = await pool.query('SELECT * FROM wishlist WHERE UsuarioID = ? AND LibroID = ?', [usuarioID, libroID]);
    if (existingRows.length > 0) {
      // Actualizar la cantidad si el libro ya está en la wishlist
      await pool.query('UPDATE wishlist SET Cantidad = Cantidad + ? WHERE UsuarioID = ? AND LibroID = ?', [cantidad, usuarioID, libroID]);
    } else {
      // Agregar el libro a la wishlist si no está presente
      await pool.query('INSERT INTO wishlist (UsuarioID, LibroID, FechaAgregado, Cantidad) VALUES (?, ?, ?, ?)', [usuarioID, libroID, fechaAgregado, cantidad]);
    }
    res.status(201).json({ message: 'Libro agregado a la wishlist' });
  } catch (error) {
    console.error('Error al agregar libro a la wishlist:', error);
    res.status(500).json({ message: 'Error al agregar libro a la wishlist' });
  }
});

// Eliminar un libro de la wishlist
router.delete('/:usuarioID/:libroID', async (req, res) => {
  const { usuarioID, libroID } = req.params;
  try {
    await pool.query('DELETE FROM wishlist WHERE UsuarioID = ? AND LibroID = ?', [usuarioID, libroID]);
    res.json({ message: 'Libro eliminado de la wishlist' });
  } catch (error) {
    console.error('Error al eliminar libro de la wishlist:', error);
    res.status(500).json({ message: 'Error al eliminar libro de la wishlist' });
  }
});

export default router;
