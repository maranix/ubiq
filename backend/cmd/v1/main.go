package main

import (
	"context"
	"fmt"
	"log/slog"
	"os"

	"github.com/jackc/pgx/v5"
)

func main() {
	conn, err := pgx.Connect(context.Background(), os.Getenv("DATABASE_ENV"))
	if err != nil {
		slog.Error(err.Error())
		os.Exit(1)
	}
	defer conn.Close(context.Background())

	var out string

	err = conn.QueryRow(context.Background(), "select version()").Scan(&out)
	if err != nil {
		slog.Error(fmt.Sprintf("Failed: %v\n", err))
		os.Exit(1)
	}

	slog.Info(out)
}
