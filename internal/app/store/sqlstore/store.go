package sqlstore

import (
	"apiserver/internal/app/store"
	"database/sql"

	_ "github.com/lib/pq"
)

// Store
type Store struct {
	db             *sql.DB
	UserRepository *UserRepository
}

// New
func New(db *sql.DB) *Store {
	return &Store{
		db: db,
	}
}

func (s *Store) User() store.UserRepository {
	if s.UserRepository != nil {
		return s.UserRepository
	}

	s.UserRepository = &UserRepository{
		store: s,
	}

	return s.UserRepository
}
